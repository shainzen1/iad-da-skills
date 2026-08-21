---
name: ki-protokoll
description: Protokolliert den KI-Einsatz an der Diplomarbeit HF IAD. Schreibt am Ende jeder Session eine ki-log-Datei mit den eigenen Prompts wörtlich und pflegt das Hilfsmittelverzeichnis, das die Schule zur DA verlangt. Aktivieren, sobald eine Session Thema, Analyse, Konzept, Design, Prototyp, User Study oder Dokumentation der DA berührt.
---

# KI-Protokoll

Die Schule verlangt zur Diplomarbeit ein **Hilfsmittelverzeichnis mit den Prompts der
zentralen Use Cases**. Am Schluss wird eine Eigenständigkeitserklärung unterschrieben, in
der steht, dass von einer KI erzeugte Texte nicht unreflektiert übernommen wurden.

Was während der Arbeit nicht protokolliert wird, existiert bei der Abgabe nicht mehr.
Nachträglich rekonstruiert heisst erfunden, und erfunden ist bei einer
Eigenständigkeitserklärung ein Problem.

Die Haltung der Schule ist dabei nicht restriktiv:

> Der Einsatz von KI ist zulässig und erwünscht, sofern er transparent dokumentiert,
> kritisch reflektiert und fachlich verantwortungsvoll erfolgt. Bewertet wird nicht der
> Einsatz der KI selbst, sondern die Qualität der daraus entstandenen Eigenleistung und der
> getroffenen Entscheidungen.

Das Protokoll ist also kein Geständnis. Es ist der Beleg, mit dem die Eigenleistung
überhaupt sichtbar wird.

---

## Die Regel

**Jede Session, die die Diplomarbeit berührt, wird protokolliert. Ohne Nachfrage.**

Berührt die DA = alles, was inhaltlich zu Thema, Analyse, Konzept, Design, Prototyp,
User Study oder Dokumentation beiträgt, oder was in den DA-Ordner schreibt.
Im Zweifel: protokollieren.

### Für den Agenten

> Wenn diese Session die Diplomarbeit berührt hat, schreibe vor dem Abschluss die
> ki-log-Datei. Wenn du unsicher bist, ob sie die DA berührt hat, schreibe sie.
> Frage nicht, ob protokolliert werden soll.

## Was geschrieben wird

Eine Datei pro Session:

```
07_Dokumentation/ki-log/DD-MM-YY-thema-slug.md
```

Inhalt: vier Zeilen Frontmatter und eine nummerierte Liste der eigenen Prompts, wörtlich.
Vorlage: [templates/_template.md](templates/_template.md).

```markdown
---
tool: Claude Code
modell: Opus 5
datum: 21-08-26
zweck: Briefing und Stundenplan ausgewertet, Projektstruktur aufgebaut
---

1. hier der erste prompt, genau so wie er getippt wurde
2. der zweite
```

Danach eine Zeile in `da-hilfsmittel.md`, falls Tool oder Verwendungszweck dort noch nicht
stehen. Vorlage: [templates/hilfsmittelverzeichnis.md](templates/hilfsmittelverzeichnis.md).

## Was nicht hineingehört

- **Keine Modell-Antworten.** Das Verzeichnis will Prompts, keine Transkripte.
- **Keine Zusammenfassungen, kein Kontext, keine Erklärungen.** So klein wie irgend möglich.
- **Keine Schönung.** Tippfehler und Mundart bleiben drin. Der Prompt ist ein Beleg, kein Text.
- **Kein Sammeln am Schluss.** Am Ende der Session, nicht am Ende des Projekts.

Der Grund für «so klein wie möglich»: ein Log, das aufwändig ist, wird nicht geführt. Ein
Log aus vier Zeilen Frontmatter und einer nummerierten Liste überlebt neun Monate.

## Warum die Datei bei den Arbeitsdateien liegt

Das Log ist **Beleg, nicht Wissen**. Es geht am Ende als Verzeichnis in die Dokumentation
und gehört deshalb zu den Abgabedateien, nicht in eine Notizen-App.

---

## Einrichten

1. **Ordner anlegen** im DA-Verzeichnis:
   ```bash
   mkdir -p 07_Dokumentation/ki-log
   ```
2. **Vorlagen kopieren:** `_template.md` und `README.md` aus
   [templates/](templates/) in den neuen Ordner.
3. **Hilfsmittelverzeichnis anlegen:** `hilfsmittelverzeichnis.md` als
   `da-hilfsmittel.md` dorthin, wo die Projektnotizen liegen.
4. **Die Regel in die CLAUDE.md des Projekts hängen.** Das ist der Teil, der dafür sorgt,
   dass es von selbst passiert: [templates/CLAUDE-snippet.md](templates/CLAUDE-snippet.md)
   in die `CLAUDE.md` im DA-Ordner kopieren, Pfade anpassen.

Ohne Schritt 4 muss jedes Mal daran gedacht werden. Mit Schritt 4 lädt Claude Code die Regel
automatisch, sobald in dem Ordner gearbeitet wird.

## Andere Tools

Claude Code protokolliert sich mit dieser Regel selbst. Alles andere geht von Hand:
ChatGPT, Midjourney, DeepL, Figma AI, Whisper, Transkriptionsdienste. Gleiche Datei,
gleiche Vorlage, gleicher Ordner. Am einfachsten direkt nach der Nutzung, solange die
Prompts noch im Verlauf des jeweiligen Tools stehen.

Für Transkriptions- und Übersetzungstools genügt in der Regel eine Zeile im Verzeichnis,
weil es dort keinen Prompt gibt. Zweck und Umfang beschreiben, zum Beispiel: «Transkription
von 6 Interviews, danach vollständig von Hand korrigiert.»

## Was daneben mitläuft

- **Verworfene Alternativen** mit Grund festhalten. «Denken in Alternativen» ist im
  Fachgespräch benotet, und die Begründung ist im Mai nicht mehr rekonstruierbar.
- **Quellen** laufend sammeln. Für KI gilt zusätzlich: bei wissenschaftlichen Aussagen wird
  die **Primärquelle** verwendet, nie die KI-Wiedergabe. Nennt ein Modell eine Studie, wird
  die Studie selbst gesucht und geprüft, bevor sie zitiert wird. Siehe Skill `da-schreiben`,
  `references/zitieren.md`.
