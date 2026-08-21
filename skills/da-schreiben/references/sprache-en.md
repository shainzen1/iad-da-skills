# Sprachschicht Englisch

**Nur mit Bewilligung.** Ohne schriftliches Ja der Studienleitung gilt Deutsch, siehe
`SKILL.md`. Diese Datei liegt fertig bereit für den Fall, dass die Bewilligung kommt.

## Warum das eine Bewilligung braucht

Drei Dokumente legen die Sprache fest, nicht eines.

> **Briefing, Minimalanforderungen Dokumentation:**
> «Die Dokumentation ist in deutscher Sprache und basierend auf dem Leitfaden für
> wissenschaftliches Arbeiten zu erstellen.»
> Darunter: «Wenn einzelne Minimalanforderungen nicht erfüllt sind, können bis zu
> 5 Punkte von der Gesamtbewertung abgezogen werden.»

> **Briefing, Präsentation:**
> «Sprache: Hochdeutsch, nach Rücksprache mit dem Expert*innen-Team in Mundart möglich.»

> **Leitfaden Kap. 2:** «Für Rechtschreibung, Zeichensetzung und Grammatik ist die jeweils
> aktuelle Duden-Ausgabe verbindlich.» Das Regulativ erklärt den Leitfaden in 6.1 E für
> verbindlich.

Daraus folgen zwei Dinge. Erstens sind Arbeit und Präsentation **zwei getrennte Anfragen**.
Zweitens ist die einzige bei der Präsentation vorgesehene Abweichung Mundart, nicht
Englisch. Die Anfrage geht schriftlich an die Studienleitung, früh, mit Begründung.

## Was gleich bleibt

Der Kern ist sprachunabhängig. Regel 1 bis 7, die Belegkette und alle zwölf
Qualitätskriterien gelten unverändert. Auch das Ich-Verbot ist eine Regel über die Person,
nicht über die Sprache.

## Was sich ändert

| Deutsch | Englisch |
|---|---|
| kein ß, immer ss | Varietät wählen und halten: **amerikanisches Englisch**, konsistent mit APA |
| «Guillemets» | "double quotes", innen 'single' |
| Zielschnitt 18 Wörter, Grenze 35 | Zielschnitt 20 Wörter, Grenze 40. Englisch verträgt etwas mehr, weil es weniger schachtelt |
| Nominalstil auf -ung | Nominalisierung auf -tion, -ment, -ance. Dasselbe Problem, andere Endung |
| Sternchen beim Gendern | neutrale Formen und Plural: participants, designers, they als Singular |
| Funktionsverbgefüge | «conduct an analysis» wird «analyse», «make a decision» wird «decide» |
| Datum: 17. Mai 2027 | APA: May 17, 2027 |

## Was im Englischen zusätzlich auffällt

- **Latinismen streichen.** utilise, facilitate, endeavour, in order to. Kurze Verben sind
  im Englischen stärker als im Deutschen, nicht schwächer.
- **Keine britisch-amerikanische Mischung.** Einmal entscheiden, dann durchhalten. Der
  Audit prüft mit `--en` auf `-ise` und `-our`.
- **Kein Hedging-Stapel.** «may possibly suggest» ist drei Abschwächungen in einem Satz.
- **Oxford comma konsistent**, egal welche Wahl.

## Audit

```bash
~/.claude/skills/da-schreiben/audit.sh --en datei.md
```

Prüft die englischen Muster statt der deutschen. Ohne Flag läuft `--de`.
