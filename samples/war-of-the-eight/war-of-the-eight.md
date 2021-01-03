Hello

I have prepared my next contribution after release the first one [Fencing Esport](https://forum.codingame.com/t/1vs1-fencing-esport-championship-winter-21/188449)

I started by the end: I wrote the documentation in order to brainstorm and get advises.

Thx in advance.

# war of the eight 

## Design

Status: DRAFT, Brainstorm

### Constraints

The puzzle game should be for eight players with the 4X experiences and only two actions: move, trade. Additionally, the player should control only one character.

### Spin-off

I would like implement several Spin-off before the huge 4X puzzle!

* Travelling salesman problem : https://en.wikipedia.org/wiki/Travelling_salesman_problem
* ...

## 🎯 The Goal

Become the best trader among the height. travel the road and deal the resources with the cities. Your deals develop the city and increase your trust. With these actions, you can obtain a decisive victory. Otherwise accumulate the biggest amount of gold.

![draftmap.jpeg|690x475](https://raw.githubusercontent.com/marcgardent/markdown2cgdoc/master/samples/war-of-the-eight/images/draftmap.jpeg) 

## ✔️ Rules

### 🏆 Victory Conditions

several ways are offered to win the game, but everybody score.

### Condition of the end:
* **Economics condition**: the first trader get X gold.
* **Political condition**: the first trader controls Y cities' council.
* **Military condition**: the first trader controls Z cities' military staff.
* **Exploratory condition**: the first trader Discovery all artefacts.
* **Timeout condition**: T turns.

> **Exploratory condition** is an early game strategy. And the  **military condition** is a counter and late game strategy.
 
### The scoring

* The player that have triggered the end of the game: X
* The others players : amount of player's gold
 
 Obviously for the timeout case, all players score the amount of his gold.

### ☠️ Defeat Conditions

* **issue conditions**: you do not respond in due time (M ms) or output an invalid command.

### Expand your influence
The referee considers the best trust and development index for each city:
* **no control**: trade, move for everyone.
* **a player controls the city's council**: trade only for the player.
* **a player controls the military staff**: move and trade only for the player.

## 🧾 Game Protocol

### 💬Output for One Game Turn

Two statements are allowed
* `MOVE` `city.id`
* `TRADE` `a_quantity` `b_quantity` `c_quantity` `d_quantity` `e_quantity` `f_quantity` `g_quantity`

|developpement  | Tiers 1     | Tiers 2     | Tiers 3     | 
|---------------|-------------|-------------|-------------|
|Population     | `a_quantity`| `d_quantity`| `g_quantity`|
|Politic        | `b_quantity`| `e_quantity`| `h_quantity`|
|Military       | `c_quantity`| `f_quantity`| `i_quantity`|

* Trade population resources: in order to increase your amount of gold and counter the **Political strategy**.
* Trade politic resources in order to build **city's council**.
* Trade military resources in order to  build the **military staff**.

### 👀Input for One Game Turn

```
FOREACH (city where you has visited)  {
   `a_quantity` `b_quantity` `c_quantity` `d_quantity` `e_quantity` `f_quantity` `g_quantity`
   `a_price` `b_price` `c_price` `d_price` `e_price` `f_price` `g_price`
   `player0_trust` `player1_trust` `player2_trust` `player3_trust` `player4_trust` `player5_trust` `player6_trust` `player7_trust`
`military_dev_index` `politic_dev_index` `population_dev_index`
}
FOR EACH player { position:city_id }
```

Mininal information for operational game:
* Prices
* trusts
* development indexes 

## Raw data

> I don't know the best way to share the cities & roads data:
>  * In the input during the turn 0
>  * In the documentation
> What is your advise?
>
> see bellow

### Cities

```csv
id, label, region_id
a, "Francport", 1
b, "Trefuse", 1
c, "Loc-à-bois", 1
d, "Odax", 1
e, "Château-saint", 1
f, "Merneuve", 2
g, "Belleroche", 2
h, "Rivemorte", 2
i, "Quevront", 2
j, "Merblanche", 3
k,"Egy", 3
l,"Bobont", 3
m, "Obetan", 4
n, "Eaumorte", 4
o, "Trenene", 4
p, "Castelvaux", 5
q, "Chambovord", 5
y, "Adgar", 6
x, "Bourg-le-loup", 6
w, "Belmont", 6
z, "Vaubavont", 6
A, "Nepos", 7
B, "Anieu", 7
C, "Puynac", 7
D, "Arne", 7
E, "Vieilac", 7
F, "Rodame", 7
r, "Haug", 8
s, "Roncevaux", 8
t, "Renatus", 8
u, "Pagne", 8
v, "Blancbord", 8
```

### Road

```
  j -- k
  k -- l
  h -- g
  g -- f
  f -- i
  i -- g
  m -- n
  n -- o
  p -- q
  x -- y
  y -- z
  z -- w
  w -- x
  C -- A
  A -- B
  B -- D
  D -- E
  E -- F
  F -- A
  C -- B
  C -- D
  C -- E
  s -- t
  s -- r
  r -- v
  v -- u
  u -- s
  u -- t
  e -- a
  a -- b
  b -- c
  c -- d
  d -- e
  e -- c
  b -- f
  c -- g
  h -- d
  h -- c
  h -- l
  h -- j
  h -- k
  i -- l
  j -- q
  k -- p
  l -- m
  l -- o
  k -- o
  o -- y
  r -- p
  r -- q
  q -- s
  z -- A
  w -- A
  v -- B
  w -- v
  r -- x
  p -- x
```