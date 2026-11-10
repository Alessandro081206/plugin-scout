#!/bin/sh
# Zeigt den Hinweis auf den Einstiegs-Guide nur, solange er noch nicht gemacht wurde.
if [ ! -f "$HOME/.claude/plugin-scout/guide-erledigt" ]; then
  echo "plugin-scout wurde neu installiert, der Einstiegs-Guide (/plugin-scout:start) wurde noch nicht gemacht. Wenn der Nutzer gerade ganz normal etwas anderes anfängt, erwähne den Guide kurz in einem Satz am Ende deiner ersten Antwort. Wenn er selbst schon einen /plugin-scout:-Befehl benutzt, erwähne den Guide NICHT am Anfang, sondern höchstens in einem kurzen Satz ganz am Ende. Danach in dieser Sitzung nicht nochmal erwähnen."
fi
exit 0
