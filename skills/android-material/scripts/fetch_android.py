#!/usr/bin/env python3
"""Fetch Android design guidance from developer.android.com as markdown.

Usage:
  fetch_android.py <path>           print one page, e.g. /design/ui/mobile/guides/layout-and-content/edge-to-edge
  fetch_android.py --crawl <dir>    crawl the design + quality guides and write each page to <dir>

The crawl covers /design/ui/** (mobile, large screens, foldables, desktop, Wear OS, TV,
cars, widgets, XR, AI glasses) and /docs/quality-guidelines/**. Output is Google's text:
read it for reference, paraphrase it in deliverables.
"""
import html
import os
import re
import sys
import urllib.request
from collections import deque

SITE = "https://developer.android.com"
UA = {"User-Agent": "Mozilla/5.0 (skill fetch script)"}
SEEDS = ["/design/ui", "/design/ui/mobile", "/design/ui/large-screens", "/design/ui/desktop",
         "/design/ui/wear", "/design/ui/tv", "/design/ui/cars", "/design/ui/widget",
         "/design/ui/xr", "/design/ui/ai-glasses", "/docs/quality-guidelines",
         "/docs/quality-guidelines/core-app-quality",
         "/docs/quality-guidelines/adaptive-app-quality"]
PREFIXES = ("/design/ui", "/docs/quality-guidelines")


def get(path):
    req = urllib.request.Request(SITE + path + ("" if "?" in path else "?hl=en"), headers=UA)
    with urllib.request.urlopen(req, timeout=40) as r:
        return r.read().decode("utf-8", "replace")


def article(page):
    m = re.search(r'<div class="devsite-article-body[^"]*"[^>]*>(.*?)<devsite-(?:content-footer|thumb-rating|feedback)', page, re.S)
    body = m.group(1) if m else ""
    t = re.search(r'<h1[^>]*class="devsite-page-title"[^>]*>(.*?)<', page, re.S) or re.search(r"<title>([^|<]*)", page)
    title = html.unescape(t.group(1)).strip() if t else ""
    return title, body


def to_md(h):
    h = re.sub(r"<(script|style|devsite-[a-z-]+-noscript)[^>]*>.*?</\1>", "", h, flags=re.S)
    h = re.sub(r"<h(\d)[^>]*>(.*?)</h\1>", lambda m: "\n" + "#" * int(m.group(1)) + " " + m.group(2) + "\n", h, flags=re.S)
    h = re.sub(r"<li[^>]*>", "\n- ", h)
    h = re.sub(r"<(strong|b)>(.*?)</\1>", r"**\2**", h, flags=re.S)
    h = re.sub(r"<(em|i)>(.*?)</\1>", r"*\2*", h, flags=re.S)
    h = re.sub(r"<code[^>]*>(.*?)</code>", r"`\1`", h, flags=re.S)
    h = re.sub(r'<img [^>]*alt="([^"]+)"[^>]*>', r"[image: \1]", h)
    h = re.sub(r"<tr[^>]*>", "\n| ", h)
    h = re.sub(r"</t[dh]>", " | ", h)
    h = re.sub(r"</p>|<br ?/?>|</div>", "\n", h)
    h = re.sub(r"<[^>]+>", "", h)
    h = html.unescape(h)
    h = re.sub(r"[ \t]+", " ", h)
    return re.sub(r"\n\s*\n\s*\n+", "\n\n", h).strip()


def page_md(path):
    page = get(path)
    title, body = article(page)
    try:  # devsite serves the page source as markdown at <path>.md.txt; prefer it
        req = urllib.request.Request(SITE + path + ".md.txt", headers=UA)
        with urllib.request.urlopen(req, timeout=40) as r:
            text = r.read().decode("utf-8", "replace")
        text = re.sub(r"!\[[^\]]*\]\([^)]*\)\s*", "", text)  # drop images
        text = re.sub(r"\.md\.txt\)", ")", text)
    except Exception:
        text = to_md(body)
    return page, f"# {title}\nSource: {SITE}{path}\n\n{text.strip()}\n"


def links(page):
    out = set()
    for m in re.finditer(r'href="(?:https://developer\.android\.com)?(/[^"#?]*)', page):
        p = m.group(1).rstrip("/")
        if p.startswith(PREFIXES) and not re.search(r"\.(png|jpg|svg|gif|zip|pdf|mp4|txt)$|/archive|/\d{4}/", p):
            out.add(p)
    return out


def crawl(outdir, limit=1500):
    os.makedirs(outdir, exist_ok=True)
    seen, q = set(), deque(SEEDS)
    while q and len(seen) < limit:
        p = q.popleft()
        if p in seen:
            continue
        seen.add(p)
        try:
            page, md = page_md(p)
        except Exception as e:
            print(f"FAIL {p}: {e}", file=sys.stderr)
            continue
        with open(os.path.join(outdir, p.strip("/").replace("/", "__") + ".md"), "w") as f:
            f.write(md)
        print(f"ok {p} ({len(md)})")
        for n in sorted(links(page)):
            if n not in seen:
                q.append(n)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    if sys.argv[1] == "--crawl":
        crawl(sys.argv[2])
    else:
        print(page_md(sys.argv[1])[1])
