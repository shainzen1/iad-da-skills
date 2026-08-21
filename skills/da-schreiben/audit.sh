#!/usr/bin/env bash
# da-schreiben audit: prueft DA-Fliesstext gegen den Schreibstandard.
# Aufruf: audit.sh [--de|--en] datei.md [weitere.md]
# Standard ist --de. --en gilt erst, wenn die Schule Englisch bewilligt hat.
# Rot heisst raeumen. Gelb heisst anschauen und entscheiden.

set -uo pipefail
MODE=de
case "${1:-}" in
  --de) MODE=de; shift ;;
  --en) MODE=en; shift ;;
esac
[ $# -eq 0 ] && { echo "Aufruf: $0 [--de|--en] <datei.md> [...]"; exit 1; }

RED=$'\033[31m'; YEL=$'\033[33m'; GRN=$'\033[32m'; OFF=$'\033[0m'
FILES=("$@")
total=0

check() { # name farbe pattern
  local name="$1" col="$2" pat="$3" out n
  out=$(grep -nEi "$pat" "${FILES[@]}" 2>/dev/null)
  n=$(printf '%s' "$out" | grep -c . || true)
  total=$((total + n))
  if [ "$n" -gt 0 ]; then
    printf '%s%3d  %s%s\n' "$col" "$n" "$name" "$OFF"
    printf '%s\n' "$out" | head -6 | cut -c1-160 | sed 's/^/       /'
    [ "$n" -gt 6 ] && echo "       ... $((n - 6)) weitere"
  else
    printf '%s%3d  %s%s\n' "$GRN" 0 "$name" "$OFF"
  fi
}

echo "== da-schreiben audit [$MODE]: ${FILES[*]} =="
echo "-- Form: immer Fehler --"
check "Gedankenstrich"     "$RED" '—|–'
check "Ausrufezeichen"     "$RED" '[[:alpha:]]!([[:space:]]|$)'

if [ "$MODE" = de ]; then
  check "Eszett statt ss"  "$RED" 'ß'
  check "deutsche Anfuehrungszeichen statt Guillemets" "$RED" '„|“'

  echo; echo "-- Stimme: im Hauptteil fast immer Fehler --"
  check "Es-Passiv"           "$RED" 'es wurde|es wurden|es konnte|es liess sich|es zeigte sich|es ist festzuhalten|wurde durchgeführt|wurde erstellt|wurden befragt|wurde untersucht|wurde entschieden'
  check "Leerformel zum Einstieg" "$RED" 'im rahmen (dieser|der vorliegenden) arbeit|in diesem kapitel wird|im folgenden wird|nachfolgend wird|zunächst soll|wie bereits erwähnt|es sei angemerkt|an dieser stelle (sei|wird)'
  check "Hedging"             "$RED" 'möglicherweise|könnte man|man kann sagen|tendenziell|gewissermassen|sozusagen|letztendlich|grundsätzlich|durchaus|eher (gut|schlecht|schwierig)|relativ (gut|schlecht|einfach|schwierig)|in gewisser weise'
  check "Design-Adjektiv ohne Beleg" "$RED" 'nutzerfreundlich|benutzerfreundlich|intuitiv|ansprechend|innovativ|spannend|clean|optimal|ideal|nahtlos|ganzheitlich|state of the art|zeitgemäss'
  check "Marketingsprache"    "$RED" 'mehrwert|abzuholen|abholen|mitnehmen|lösungen anbieten|erlebnis schaffen|game.?changer|elevate|seamless|auf das nächste level'
  check "Funktionsverbgefüge" "$YEL" 'zur anwendung (kommen|gelangen)|eine entscheidung (zu )?treffen|in betracht (zu )?ziehen|zum einsatz (kommen|kam)|zur durchführung|eine überprüfung vornehmen|in erfahrung bringen|unter beweis stellen'
  check "Negation zuerst"     "$YEL" 'nicht [a-zäöüß]+, sondern'

  echo; echo "-- Kontext entscheidet --"
  check "Ich-Form (nur Exposé, Fazit, Reflexion, Zitate)" "$YEL" '\b(ich|mir|mich|meine[nrms]?|wir|uns|unsere[nrms]?)\b'
  check "direkte Ansprache"   "$YEL" '\b(sie erhalten|sie sehen|sie finden|du siehst|man merkt|stellen sie sich)\b'
  check "Modewort, bei Ersterwähnung einführen oder streichen" "$YEL" '\b(journey|touchpoints?|pain.?points?|onboarding|look and feel|mindset|insights?|deep.?dive|alignment)\b'
  check "Nominalstil: zwei -ung im Satz" "$YEL" '[a-zäöü]{4,}ung[^.!?]{0,60}[a-zäöü]{4,}ung'
  gm=$(grep -oE "[A-Za-zäöü]+\*innen?|[A-Za-zäöü]+:innen?" "${FILES[@]}" 2>/dev/null | grep -oE "\*|:" | sort -u | wc -l | tr -d " ")
  if [ "${gm:-0}" -gt 1 ]; then
    printf '%s%3d  Gendern gemischt: * und : nebeneinander, eine Form waehlen%s\n' "$RED" 1 "$OFF"
    total=$((total + 1))
  else
    printf '%s%3d  Gendern einheitlich%s\n' "$GRN" 0 "$OFF"
  fi
  MAX=35
else
  check "britische Schreibung (amerikanisch waehlen und halten)" "$YEL" '\b[a-z]+(isation|isations|ised|ising|ise)\b|\b(behaviour|colour|analyse|centre|labour|favour)\b'
  check "typografische Anfuehrungszeichen fehlen" "$YEL" '„|“|«|»'

  echo; echo "-- Stimme: im Hauptteil fast immer Fehler --"
  check "Passiv als Ersatz fuers Ich" "$RED" 'it was (decided|found|observed|noted|shown)|was conducted|were conducted|was carried out|has been (conducted|performed)|it can be seen'
  check "Leerformel zum Einstieg"     "$RED" 'in the context of this (thesis|work)|this chapter (will )?describ|this section (will )?present|in order to|as mentioned (above|earlier)|it should be noted|it is important to note'
  check "Hedging"                     "$RED" 'may potentially|could be argued|somewhat|arguably|to some extent|rather (good|poor|difficult)|it is possible that|seems to suggest'
  check "Design-Adjektiv ohne Beleg"  "$RED" 'user.?friendly|intuitive|seamless|innovative|cutting.?edge|state of the art|engaging|clean design|modern (design|approach|solution)|holistic'
  check "Marketingsprache"            "$RED" 'value.?add|elevate|unlock|game.?changer|next level|leverage|best.in.class'
  check "Nominalisierung"             "$YEL" '(conduct|perform|carry out|make|provide)(ed|s|) an? [a-z]+(tion|ment|ance|sis)\b'
  check "Negation zuerst"             "$YEL" 'not [a-z]+, but'

  echo; echo "-- Kontext entscheidet --"
  check "Ich-Form (nur Expose, Fazit, Reflexion, Zitate)" "$YEL" '\b(I|my|me|we|our|us)\b'
  check "direkte Ansprache"           "$YEL" '\b(you (can|will|should|see)|imagine that|note that)\b'
  MAX=40
fi

echo
python3 - "$MAX" "${FILES[@]}" <<'PY'
import io, re, sys
mx = int(sys.argv[1]); lang = 0
for p in sys.argv[2:]:
    try:
        t = io.open(p, encoding="utf-8").read()
    except OSError:
        continue
    t = re.sub(r'\A---\n.*?\n---\n', ' ', t, flags=re.S)   # YAML-Frontmatter raus
    t = re.sub(r'```.*?```', ' ', t, flags=re.S)
    t = re.sub(r'^\s*([|#>]|[-*] ).*$', ' ', t, flags=re.M)
    for s in re.split(r'(?<=[.!?])\s+', t):
        s = " ".join(s.split()); w = len(s.split())
        if w > mx:
            lang += 1
            if lang <= 5:
                print("\033[33m  %d Wörter:\033[0m %s ..." % (w, s[:90]))
col = "\033[32m" if not lang else "\033[33m"
print("%s  %d Sätze über %d Wörter\033[0m" % (col, lang, mx))
PY

echo
echo "Treffer gesamt ohne Satzlänge: $total"
