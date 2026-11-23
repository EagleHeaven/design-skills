#!/usr/bin/env python3
"""Fetch a live Material Design 3 page (m3.material.io) as markdown.

Usage:
  fetch_m3.py <slug>          print the page, e.g. components/buttons, foundations/layout/understanding-layout/overview
  fetch_m3.py --list          print every slug with its file id
  fetch_m3.py --dump <dir>    write every page as <dir>/<slug with / replaced by __>.md

Source: the public JSON that the m3.material.io Angular app loads
(/_dsm/content/m3/<version>/<fileId>.json). The route table (slug -> fileId) and the
published content version are read from the site's main bundle, so this follows the
live site. Output is Google's text: read it for reference, paraphrase it in deliverables.
"""
import html
import json
import os
import re
import sys
import urllib.request

SITE = "https://m3.material.io"
UA = {"User-Agent": "Mozilla/5.0 (skill fetch script)"}


def get(url, as_json=False):
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=40) as r:
        data = r.read().decode("utf-8")
    return json.loads(data) if as_json else data


def routes():
    page = get(SITE + "/")
    main = re.search(r'src="(/static/angular/main\.[0-9a-f]+\.js)"', page).group(1)
    js = get(SITE + main)
    version = re.search(r'carbonVersion:"([^"]+)"', js).group(1)
    table = {}
    # Route objects: {"slug":"...", [metadata...], "exportedCarbonFileId":"<id>.json", ...}
    pat = r'\{"slug":"([^"]*)"((?:(?!\{"slug":).){0,6000}?)"exportedCarbonFileId":"([^"]+\.json)"'
    for m in re.finditer(pat, js, flags=re.S):
        table.setdefault(m.group(1), m.group(3))
    return version, table


def to_md(h):
    if not h:
        return ""
    h = re.sub(r"<h(\d)[^>]*>(.*?)</h\1>", lambda m: "\n" + "#" * (int(m.group(1)) + 2) + " " + m.group(2) + "\n", h, flags=re.S)
    h = re.sub(r"<li[^>]*>", "\n- ", h)
    h = re.sub(r"<(strong|b)>(.*?)</\1>", r"**\2**", h, flags=re.S)
    h = re.sub(r"<(em|i)>(.*?)</\1>", r"*\2*", h, flags=re.S)
    h = re.sub(r"<code>(.*?)</code>", r"`\1`", h, flags=re.S)
    h = re.sub(r'<a [^>]*href="([^"]+)"[^>]*>(.*?)</a>', r"\2 (\1)", h, flags=re.S)
    h = re.sub(r"<tr[^>]*>", "\n| ", h)
    h = re.sub(r"</t[dh]>", " | ", h)
    h = re.sub(r"</p>|<br ?/?>", "\n", h)
    h = re.sub(r"<[^>]+>", "", h)
    h = html.unescape(h)
    return re.sub(r"\n{3,}", "\n\n", h).strip()


def page_md(slug, version, table):
    fid = table.get(slug.strip("/"))
    if not fid:
        raise SystemExit(f"unknown slug: {slug} (try --list)")
    d = get(f"{SITE}/_dsm/content/m3/{version}/{fid}", as_json=True)
    out = [f"# {d.get('headerTitle') or d.get('title')}", f"Source: {SITE}/{slug.strip('/')}"]
    if d.get("description"):
        out.append(to_md(d["description"]))
    for s in d.get("sections", []):
        if not s.get("isVisible", True):
            continue
        out.append(f"\n## {s.get('name')}")
        for b in s.get("contentBlocks", []):
            if b.get("isHidden"):
                continue
            if b.get("title"):
                out.append(f"\n### {to_md(b['title'])}")
            for c in b.get("contentChunks", []):
                t = to_md(c.get("htmlValue"))
                mod = c.get("captionModifier")
                if mod and t:
                    t = f"[{mod}] {t}"
                elif mod and c.get("altText"):
                    t = f"[{mod}] {c['altText']}"
                if t:
                    out.append(t)
                if c.get("snippetCode"):
                    out.append("```" + (c.get("snippetLanguage") or "") + "\n" + c["snippetCode"] + "\n```")
    return "\n\n".join(out) + "\n"


def main():
    if len(sys.argv) < 2:
        raise SystemExit(__doc__)
    version, table = routes()
    if sys.argv[1] == "--list":
        print(f"# content version {version}, {len(table)} pages")
        for slug in sorted(table):
            print(slug)
    elif sys.argv[1] == "--dump":
        out = sys.argv[2]
        os.makedirs(out, exist_ok=True)
        for slug in sorted(table):
            if not slug:
                continue
            try:
                md = page_md(slug, version, table)
            except Exception as e:  # keep going; report failures
                print(f"FAIL {slug}: {e}", file=sys.stderr)
                continue
            with open(os.path.join(out, slug.replace("/", "__") + ".md"), "w") as f:
                f.write(md)
            print(f"ok {slug} ({len(md)} chars)")
    else:
        print(page_md(sys.argv[1], version, table))


if __name__ == "__main__":
    main()
