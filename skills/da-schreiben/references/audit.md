# Audit

Die Prüfung wird ausgeführt, nicht geschätzt. «Sieht sauber aus» ist kein Ergebnis.

```bash
~/.claude/skills/da-schreiben/audit.sh datei.md [weitere.md]
```

Rot heisst räumen. Gelb heisst anschauen und entscheiden. Grün heisst null Treffer.

## Was geprüft wird

| Prüfung | Farbe | Warum |
|---|---|---|
| Eszett | rot | Schweizer Hochdeutsch kennt kein ß |
| Gedankenstrich | rot | die DA setzt Punkt oder Doppelpunkt |
| deutsche Anführungszeichen | rot | das Briefing nutzt «Guillemets» |
| Ausrufezeichen | rot | keine Dekoration im Fliesstext |
| Es-Passiv | rot | der Ersatzreflex für das verbotene Ich, siehe Regel 1 |
| Leerformel zum Einstieg | rot | «Im Rahmen dieser Arbeit» sagt nichts |
| Hedging | rot | Behauptung oder Beleg, nichts dazwischen |
| Design-Adjektiv ohne Beleg | rot | nutzerfreundlich und intuitiv sind das Ergebnis der Arbeit, nicht ihre Behauptung |
| Marketingsprache | rot | gehört auf eine Website, nicht in eine wissenschaftliche Arbeit |
| Funktionsverbgefüge | gelb | «zur Anwendung kommen» ist ein verstecktes Verb |
| Negation zuerst | gelb | sagen, was etwas ist |
| Ich-Form | gelb | im Exposé, Fazit, in der Reflexion und in Zitaten richtig, sonst falsch |
| direkte Ansprache | gelb | gleiche Ausnahmen wie beim Ich |
| Nominalstil, zwei -ung im Satz | gelb | fast immer mit Verben besser |
| Gendern gemischt | rot | entweder durchgehend `*` oder durchgehend `:`, nie beides |
| Sätze über 35 Wörter | gelb | teilen |

## Was die Prüfung nicht kann

Sie liest keine Argumente. Diese vier Dinge bleiben von Hand, und sie sind die wichtigeren:

1. **Belegkette.** Ist jede Aussage Erhebung, Quelle oder markierte Annahme? Eine vierte Sorte
   gibt es nicht.
2. **Claim-first.** Behauptet der erste Satz jedes Abschnitts, oder kündigt er an?
3. **Begriffstreue.** Heisst dieselbe Sache im ganzen Dokument gleich?
4. **Der Eröffnungssatz-Test.** Nur die ersten Sätze aller Abschnitte hintereinander lesen.
   Ergeben sie eine Geschichte? Wenn nicht, ist die Gliederung das Problem, nicht die Sprache.

## Einzelne Muster von Hand

```bash
grep -nE 'ß|—|–|„|“' datei.md                              # Form
grep -niE 'es wurde|es konnte|im rahmen dieser' datei.md   # Es-Passiv und Leerformeln
grep -niE '\b(ich|mir|mich|meine)\b' datei.md              # Ich-Form, Kapitel prüfen
grep -niE 'nutzerfreundlich|intuitiv|innovativ' datei.md   # unbelegte Adjektive
```

## Grenzen des Skripts

`audit.sh` ist reines Grep. Es findet Muster, keine Bedeutung. Zwei Konsequenzen:

- **Falsche Treffer sind normal.** Ein «ich» in einem wörtlichen Zitat ist richtig, das
  Skript markiert es trotzdem. Gelb heisst anschauen, nicht löschen.
- **Null Treffer ist kein Gütesiegel.** Ein Text kann sauber durch das Audit gehen und
  trotzdem nichts belegen. Die vier Prüfungen von Hand oben sind die wichtigeren.
