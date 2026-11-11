#!/bin/sh
# Prüft den Aufbau von plugin-scout. Kostenlos, braucht nur sh und python3.
# Aufruf: sh tests/pruefen.sh
cd "$(dirname "$0")/.." || exit 1
FEHLER=0
ok()   { echo "  ✅ $1"; }
nein() { echo "  ❌ $1"; FEHLER=$((FEHLER+1)); }

echo "JSON-Dateien"
for f in .claude-plugin/plugin.json .claude-plugin/marketplace.json; do
  if python3 -m json.tool "$f" >/dev/null 2>&1; then ok "$f ist gültig"; else nein "$f ist kein gültiges JSON"; fi
done

echo "Name und Version"
V1=$(python3 -c "import json;print(json.load(open('.claude-plugin/plugin.json'))['version'])")
V2=$(python3 -c "import json;d=json.load(open('.claude-plugin/marketplace.json'));print([p for p in d['plugins'] if p['name']=='plugin-scout'][0].get('version',''))")
[ "$V1" = "$V2" ] && ok "Version $V1 ist in beiden Dateien gleich" || nein "Version unterschiedlich: plugin.json=$V1, marketplace.json=$V2"
python3 -c "import json;d=json.load(open('.claude-plugin/plugin.json'));assert d['name']=='plugin-scout' and d.get('license') and d.get('description')" 2>/dev/null \
  && ok "plugin.json hat Name, Beschreibung und Lizenz" || nein "plugin.json: Name, Beschreibung oder Lizenz fehlt"
[ -f LICENSE ] && ok "LICENSE vorhanden" || nein "LICENSE fehlt"

echo "Befehle"
for f in commands/*.md; do
  head -5 "$f" | grep -q '^description:' && ok "$f hat eine Beschreibung" || nein "$f: 'description:' fehlt oben"
done
head -5 skills/plugin-scout/SKILL.md | grep -q '^description:' && ok "Skill hat eine Beschreibung" || nein "Skill: 'description:' fehlt"

echo "Keine persönlichen Daten / festen Namen"
[ ! -e daten ] && ok "kein daten/-Ordner im Repo" || nein "daten/ liegt im Repo (persönliche Daten gehören ins private Daten-Repo)"
MUSTER="-e daten/profil -e repos/Alessandro081206 -e Alessandro081206/plugin-scout-daten"
if grep -rn $MUSTER commands skills vorlagen >/dev/null; then
  nein "fester Daten-Repo-Name gefunden:"; grep -rn $MUSTER commands skills vorlagen
else ok "Daten-Repo wird nirgends fest eingetragen"; fi
grep -q '<WEEKLY_REPO>' vorlagen/weekly-routine.md && ok "Routine-Vorlage hat Platzhalter <WEEKLY_REPO>" || nein "Routine-Vorlage ohne Platzhalter"

echo "Keine Skripte, die automatisch laufen"
[ ! -e hooks ] && [ ! -e scripts ] && ok "keine Hooks/Skripte (dürfen nur verifizierte Firmen im Verzeichnis)" || nein "hooks/ oder scripts/ vorhanden"

if command -v claude >/dev/null 2>&1; then
  echo "Claude-Prüfung"
  claude plugin validate . >/dev/null 2>&1 && ok "claude plugin validate ." || nein "claude plugin validate . meldet Fehler (Details: claude plugin validate .)"
fi

echo
if [ $FEHLER -eq 0 ]; then echo "Alles in Ordnung ✅"; else echo "$FEHLER Problem(e) gefunden ❌"; exit 1; fi
