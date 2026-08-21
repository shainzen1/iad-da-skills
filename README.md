# IAD DA Skills

Zwei Claude-Skills für die Diplomarbeit HF Interaction Design an der Schule für Gestaltung
Bern und Biel:

- **`da-schreiben`** legt fest, wie der Fliesstext der Arbeit klingt. Wissenschaftliche
  Prosa auf Schweizer Hochdeutsch, Zeile für Zeile abgeglichen mit Regulativ, Leitfaden und
  Briefing, inklusive Zitierregeln, der Liste der formalen Mindestanforderungen und einem
  Skript, das den Text gegen den Standard prüft.
- **`ki-protokoll`** hält den KI-Einsatz fest. Es schreibt am Ende jeder Session die eigenen
  Prompts mit und pflegt das Hilfsmittelverzeichnis, das die Schule zur DA verlangt.

Gebaut für die eigene DA, aufgeräumt für die Klasse. Nimm, was du brauchst, wirf raus, was
nicht passt.

---

## Installation

Für **Claude Code**:

```bash
git clone https://github.com/shainzen1/iad-da-skills.git
cd iad-da-skills
./install.sh
```

Das kopiert beide Skills nach `~/.claude/skills/`. Vorhandene Ordner werden nicht
überschrieben, ohne dass gefragt wird. Danach neu starten und mit `/da-schreiben` oder
`/ki-protokoll` aufrufen, oder einfach an der DA arbeiten: Claude zieht den passenden Skill
selbst.

Von Hand geht genauso:

```bash
cp -r skills/da-schreiben skills/ki-protokoll ~/.claude/skills/
```

**Ohne Claude Code:** die Dateien sind normales Markdown. `skills/da-schreiben/SKILL.md`
lässt sich als Custom Instruction oder Projektanweisung in ChatGPT, Claude.ai oder Gemini
einsetzen. Nur `audit.sh` braucht ein Terminal.

## Was drin ist

```
skills/
  da-schreiben/
    SKILL.md                      der Standard: Belegkette, sieben Regeln, Typografie, Verbote
    audit.sh                      prüft eine Datei gegen den Standard, deutsch oder englisch
    references/
      zitieren.md                 Zitieren und Quellen nach Leitfaden Kap. 6 und 7
      mindestanforderungen.md     die formalen Punkte aus Regulativ 6.1, die Punkte kosten
      balzert.md                  die zwölf Qualitätskriterien, übersetzt ins Schreiben
      audit.md                    was das Skript prüft und was es nicht kann
      eigene-stimme.md            die eigene Schreibstimme dazumischen
      sprache-en.md               die Englischschicht, nur mit Bewilligung
  ki-protokoll/
    SKILL.md                      die Protokollregel und wie man sie einrichtet
    templates/
      _template.md                die Log-Datei, vier Zeilen Frontmatter plus Prompts
      README.md                   für den ki-log-Ordner
      hilfsmittelverzeichnis.md   die Tabelle, die am Ende in die Doku geht
      CLAUDE-snippet.md           der Block für die CLAUDE.md im DA-Ordner
```

## Der Audit

```bash
~/.claude/skills/da-schreiben/audit.sh 04_konzept.md
```

Zählt Eszett, Gedankenstriche, Es-Passiv, Hedging, unbelegte Design-Adjektive,
Marketingsprache, gemischtes Gendern und Sätze über 35 Wörter. Rot heisst räumen, gelb
heisst anschauen, grün heisst null Treffer.

Das Skript ist reines Grep. Es findet Muster, keine Bedeutung. Falsche Treffer sind normal,
und null Treffer ist kein Gütesiegel. Die vier Prüfungen, die zählen, bleiben von Hand und
stehen in `references/audit.md`.

## Anpassen

Die Skills sind Markdown, kein Code. Aufmachen und ändern ist der vorgesehene Weg.

- Eigene Schreibstimme dazulegen: `references/eigene-stimme.md` erklärt, wie.
- Eigene Ticks in den Audit: in `audit.sh` bei `check "..."` ein Muster ergänzen.
- Pfade im `ki-protokoll` an die eigene Ordnerstruktur anpassen.

## Zwei Warnungen

**Das hier ist kein offizielles Schulmaterial.** Es ist die Zusammenfassung einer
Mitstudierenden-Lektüre von Regulativ, Leitfaden und Briefing, Stand August 2026. Bei jedem
Widerspruch gelten die Originaldokumente, nicht diese Dateien. Regulativ und Leitfaden
selber lesen.

**Der Text bleibt deine Eigenleistung, und die ist benotet.** Diese Skills legen fest, wie
die Arbeit klingt, nicht was drinsteht. Eine KI, die für dich argumentiert, produziert genau
die Sorte Text, die im Fachgespräch auffliegt. Und was du sie machen lässt, kommt ins
Hilfsmittelverzeichnis, dafür ist der zweite Skill da.

## Lizenz

MIT, siehe [LICENSE](LICENSE). Fork, ändern, weitergeben, alles erlaubt.

Verbesserungen gerne als Pull Request oder Issue. Wer eine Stelle im Regulativ oder
Leitfaden findet, die hier falsch wiedergegeben ist: bitte melden, das ist die wichtigste
Sorte Korrektur.
