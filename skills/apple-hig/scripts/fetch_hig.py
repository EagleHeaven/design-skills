#!/usr/bin/env python3
"""Fetch a live Apple HIG page as markdown.

Usage:
  fetch_hig.py <slug>        print the page (e.g. materials, tab-bars, sheets)
  fetch_hig.py --list        print every HIG slug with its title

Source: Apple's public DocC JSON behind developer.apple.com/design/human-interface-guidelines.
Output is Apple's text: read it for reference, paraphrase it in deliverables.
"""
import json
import sys
import urllib.request

BASE = "https://developer.apple.com/tutorials/data"
ROOT = "/design/human-interface-guidelines"


def get(path):
    with urllib.request.urlopen(BASE + path + ".json", timeout=30) as r:
        return json.load(r)


def inline(items, refs):
    s = ""
    for it in items or []:
        t = it.get("type")
        if t == "text":
            s += it["text"]
        elif t == "strong":
            s += "**" + inline(it.get("inlineContent"), refs) + "**"
        elif t in ("emphasis", "newTerm"):
            s += "*" + inline(it.get("inlineContent"), refs) + "*"
        elif t == "codeVoice":
            s += "`" + it.get("code", "") + "`"
        elif t == "reference":
            s += refs.get(it.get("identifier"), {}).get("title") or ""
        elif t == "link":
            s += it.get("title", "")
        elif t != "image":
            s += inline(it.get("inlineContent"), refs)
    return s


def block(b, refs, out):
    t = b.get("type")
    if t == "heading":
        out.append("\n" + "#" * (b.get("level", 2) + 1) + " " + b.get("text", ""))
    elif t == "paragraph":
        out.append(inline(b.get("inlineContent"), refs))
    elif t in ("unorderedList", "orderedList"):
        for i in b.get("items", []):
            sub = []
            for c in i.get("content", []):
                block(c, refs, sub)
            out.append("- " + " ".join(sub))
    elif t == "aside":
        sub = []
        for c in b.get("content", []):
            block(c, refs, sub)
        out.append("> " + (b.get("name") or b.get("style", "")) + ": " + " ".join(sub))
    elif t == "table":
        for row in b.get("rows", []):
            cells = []
            for c in row:
                sub = []
                for x in c:
                    block(x, refs, sub)
                cells.append(" ".join(sub))
            out.append("| " + " | ".join(cells) + " |")
    elif t == "row":
        for col in b.get("columns", []):
            for c in col.get("content", []):
                block(c, refs, out)
    elif t == "tabNavigator":
        for tab in b.get("tabs", []):
            out.append("[" + str(tab.get("title")) + "]")
            for c in tab.get("content", []):
                block(c, refs, out)
    else:
        for c in b.get("content", []) or []:
            block(c, refs, out)


def page(slug):
    d = get(ROOT + "/" + slug)
    refs = d.get("references", {})
    out = ["# " + d.get("metadata", {}).get("title", slug), inline(d.get("abstract"), refs)]
    for sec in d.get("primaryContentSections", []):
        for b in sec.get("content", []):
            block(b, refs, out)
    out.append("\nSource: https://developer.apple.com" + ROOT + "/" + slug)
    return "\n".join(out)


def list_all():
    seen = []

    def walk(path, depth):
        d = get(path)
        for s in d.get("topicSections", []):
            for ident in s.get("identifiers", []):
                ref = d["references"].get(ident, {})
                url = ref.get("url", "")
                if url.startswith(ROOT + "/") and url not in seen:
                    seen.append(url)
                    print("  " * depth + url.rsplit("/", 1)[-1] + "  (" + ref.get("title", "") + ")")
                    if depth < 2:
                        walk(url, depth + 1)

    walk(ROOT, 0)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    if sys.argv[1] == "--list":
        list_all()
    else:
        print(page(sys.argv[1]))
