#!/bin/sh
# Zeigt den Hinweis auf den Einstiegs-Guide nur, solange er noch nicht gemacht wurde.
if [ ! -f "$HOME/.claude/plugin-scout/guide-erledigt" ]; then
  echo "plugin-scout wurde neu installiert und der Einstiegs-Guide wurde noch nicht gemacht. Begrüße den Nutzer in deiner ersten Antwort kurz und freundlich und schlag ihm vor, den Guide mit /plugin-scout:start zu starten (er findet dort Plugins, die zu seinem Use Case passen). Nur ein, zwei Sätze, nicht aufdringlich."
fi
exit 0
