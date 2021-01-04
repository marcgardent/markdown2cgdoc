# markdown2cg

Save your time and don't repeat yourself: write the puzzle game for *Codingame* platform with the `Markdown` syntax.

> The promise :) Writing a CG doc will never be a nightmare again!

## Features

* Use the emojis to tags the specific CG sections.
* You can append a conditional statement to handle the leagues. 
* New blocks are marked as new according to conditional statements.
* Wrapped words with *`backticks* are rendered as **variables** or **constant** or **actions** according to the state of the first letter: lowercase, digit, uppercase.

* Output the complete `HTML` page with the `CSS` for reviewing.
* Output the `HTML` for publishing the puzzle game!

> The markdown stays *human-readable* for sharing on the forum and maintainers!

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
./markdown2cg.ps1 -Source mymarkdown.md -ReleaseDestination ./cg_project/config/

#add ReviewDestination to generate browsable html file:
./markdown2cg.ps1 -Source mymarkdown.md -ReviewDestination ./cg_project/doc/

#Or both:
./markdown2cg.ps1 -Source mymarkdown.md -ReleaseDestination ./cg_project/config/ -ReviewDestination ./cg_project/doc/

#Or both:
./markdown2cg.ps1 -Source mymarkdown.md -ReleaseDestination ./cg_project/config/ -ReviewDestination ./cg_project/doc/ -


#Enable logs
$VerbosePreference='Continue'
./markdown2cg.ps1 -Source mymarkdown.md -ReleaseDestination ./cg_project/config/ -ReviewDestination ./cg_project/doc/

```

### Gradle

TODO: implement a task to generate the doc directly with a Gradle task

## Syntax

### Variables & co 

wrap your **variables** and **constants** and **actions**  with *`backticks*. The state of first letter determine the type: 
* **action** (uppercase): `ACTION`,  `ACTION_10`, `NOWRAP 10` 
* **constant** (digit): `000`, `-1`, `+10units`, `5`,  `5 nowrap` 
* **variable** (lowercase): `variable`
* TODO Fix the case: `10 units` test=`ACTION 10`  the spaces aren't  accepted for the moment. 

### Layout

Use these the Emojies and the hierarchy to render correctly the document:

```markdown 

<markdown not exported>

# <Game title, header no-exported>

<markdown not-exported>

## 🎯 <The Goal title>

<markdown>

## ✔️ <Rules title>

<markdown>

### 🏆 <Victory Conditions title>

<markdown>

### ☠️ <Defeat Conditions title>

<markdown>

### <Custom section title>

<markdown>

## 🐯 <Expert Rules title>

<markdown>

## ⚠️ <Note title>

<markdown>

## 📝 <Pseudocode title>

<markdown>

## 💡 <Hint title>

<markdown>

## <Custom Section>

<markdown>

## 🧾 <Game Protocol title>

<markdown>

### 👀<title Input>

<markdown>

#### 📑<line label>: <short description>

<markdown>

### 👀<title Input>

<markdown>

#### 📑<line label>: <short description>

<markdown>

#### 📑<line label>: <short description>

<markdown>

### 💬 <title Output>

<markdown>

#### 📑<line label>: <short description>

<markdown>

### ⚓<Constraints title>

<markdown>

```

> You can change the order and remove as you want!

### Conditional block

DRY! You can append a conditional statement to handle the leagues at any header:

* `### LEAGUE == 1`: league 1 only
* `### LEAGUE <= 2`: league 1,2
* `### LEAGUE >= 3`:
  * league 3 as new:green highlight
  * league 4,5,...

The header is removed. but if you want to keep it add a label like this: `## my label: LEAGUE >= 3`

Get Started with [layout.md](./sample/layout.md)!