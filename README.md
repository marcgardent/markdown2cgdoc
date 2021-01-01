# markdown2cg

Save your time and don't repeat yourself: write the puzzle game for codingame platform with the `Markdown` syntax.

> The promise :) Writing a CG doc will never be a nightmare again!

## Features

* Use the emojies to tags the specific CG sections 🎯✔️🐯⚠️🧾📝💡.
* You can append a conditional statement to handle the leagues. 
* New blocks are marked as new according to conditional statements.
* Wrapped words with *`backticks* are rendered as **variables** or **constant** or **actions** according to  the state of first letter: lowercase, digit, uppercase.

* Output the complete `HTML` page with the `CSS` for reviewing.
* Output the `HTML` for publishing the puzzle game!

> The markdown stays *human-readable* for share on the forum and maintainers!

## Usage

### Prerequisites

Install powershell 6.1+ for your environment:
* **Linux**: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux
* **Windows**: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows
* **Docker**: see https://hub.docker.com/_/microsoft-powershell

### CLI

the script `markdown2cg.ps1` is a standalone file! You can copy anywhere and convert your *markdown*:

```powershell
# Release the doc:
./markdown2cg.ps1 -source mymarkdown.md -dest ./cg_project/config/

#add reviewDest to generate browsable html file:
./markdown2cg.ps1 -source mymarkdown.md -reviewDest ./cg_project/doc/

#Or both:
./markdown2cg.ps1 -source mymarkdown.md -dest ./cg_project/config/ -reviewDest ./cg_project/doc/

#Enable logs
$VerbosePreference='Continue'
./markdown2cg.ps1 -source mymarkdown.md -dest ./cg_project/config/ -reviewDest ./cg_project/doc/

```

### Gradle

TODO: implement a task to generate the doc directly with a gradle task

## Syntax

### Variables & co 

wrap your **variables** and **constants** and **actions**  with *`backticks*. The state of first letter determine the type: 
* **action** (uppercase): `ACTION`,  `ACTION 10`
* **constant** (digit): `000`, `-1`, `+10 units`, `5` 
* **variable** (lowercase): `variable`

### Chapters H2

`h2` are wrapped with the specific CG HTML. And You can use an emoji to add the section's icon
  * 🎯 The Goal
  * ✔️ Rules
  * 🐯 Expert Rules
  * ⚠️ Note
  * 🧾 Game Protocol
  * 📝 Pseudocode
  * 💡 Hint
* `h3`: inline css-style is injected
* `h4+`: no handle

### 🧾 Game Protocol Layout

In the *Game Protocol* chapter you have to respect very specific layout:

```
## Game Protocol

here text accepted

### Input

here text accepted

#### Line X

line X content

### Output

here text accepted

#### Line X

line X content

### Constraints

Constraints_Content

```

### Conditional statement

DIY! You can append a conditional statement to handle the leagues:

* `### LEAGUE == 1`: league 1 only
* `### LEAGUE <= 2`: league 1,2
* `### LEAGUE >= 3`:
  * league 3 as new:green highlight
  * league 4,5,...

The header is removed but if you want keep it add a label like this: `### my label: LEAGUE >= 3`
