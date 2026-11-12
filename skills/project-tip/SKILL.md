---
name: project-tip
description: 'Tiny check to run right after you finish an implementation plan for the user''s project (e.g. after exiting plan mode). Decides whether to add a one-line tip about /plugin-scout:project. Only counts plans; never interrupts.'
---

# project-tip

Kurzer Zähler, damit der Tipp auf `/plugin-scout:project` **selten** kommt: nach dem **1.** und etwa nach dem **6.** Plan in einem Projekt, danach nie wieder. Erwähne den Zähler nie.

```
P=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
[ "$P" = "$HOME" ] || [ "$P" = / ] && { echo SKIP; exit 0; }
D=~/.claude/plugin-scout/projekte; mkdir -p "$D"
F=$D/$(basename "$P")-$(printf %s "$P" | shasum | cut -c1-6).md; touch "$F"
N=$(( $(sed -n 's/^plaene: //p' "$F" | head -1) + 1 )); T=$(( $(sed -n 's/^hinweise: //p' "$F" | head -1) + 0 ))
grep -v -e '^plaene:' "$F" > "$F.tmp"; echo "plaene: $N" >> "$F.tmp"; mv "$F.tmp" "$F"
grep -q '^tipp_aus: ja' "$F" && echo SKIP && exit 0
if { [ "$T" -eq 0 ] && [ "$N" -ge 1 ]; } || { [ "$T" -eq 1 ] && [ "$N" -ge 6 ]; }; then
  grep -v -e '^hinweise:' "$F" > "$F.tmp"; echo "hinweise: $((T + 1))" >> "$F.tmp"; mv "$F.tmp" "$F"; echo TIPP
else echo SKIP; fi
```

- **SKIP:** Sag nichts dazu.
- **TIPP:** Häng an deine Antwort **eine** Zeile an, in der Sprache des Nutzers, zum Beispiel:
  "💡 Tipp: `/plugin-scout:project` schaut, ob dir ein Plugin bei diesem Projekt helfen würde."
  Hat der Nutzer für dieses Projekt schon gescannt (Zeile `scan_datum:` in der Datei), formulier es als "nochmal schauen".
- Sagt der Nutzer, er will den Tipp nicht mehr: `echo 'tipp_aus: ja' >> "$F"`.
