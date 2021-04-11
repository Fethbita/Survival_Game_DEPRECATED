# A text based, round based mobile survival game

![Older version gameplay demo](demo.gif)

## Status Unknown

The name of the game. It is related to the story. Protagonist has no idea how he got lost, nor does he know his status. He is having a memory loss, but in time he will start to remember some things or not. It will be decided according to the storyline. He actually doesn't lose memories, he just doesn't remember what he is doing sometimes. This is called a fugue state. This will give us the chance to use a lot of surprising events within the story.

Health and energy bar will be at the top of the screen.

There will be two phases of a day. Daytime and nighttime. You can choose to do only two actions in one phase.

There is a chance eating berries or mushrooms gets you

## Daytime

**Characteristics**
* Player is able to explore without a torch.
* Either it is daytime or nighttime
* A chance to get attacked by an animal. For now, let's say 5%.
* A chance to find the next chapter of the story.
* A chance to get lost. For now, let's say 5%.
* If wounded, there is a possibility of wound infection. Wound infection makes you lose 100 health, every phase. For now, let's say 10% if only you get attacked by an animal.
* A chance to fall down and cut himself. For now, let's say 5%.

## Nighttime

**Characteristics**
* Exploring can be done with a torch but not effective.
* A chance to get attacked by an animal. For now, let's say 10%.
* A chance to get lost. For now, let's say %10.
* If wounded, there is a possibility of wound infection. Wound infection makes you lose 100 health, every phase. For now, let's say 10% if only you get attacked by an animal.
* A chance to fall down and cut himself. For now, let's say 10%.

## Items

Player can only equip two tools. When the player wears a backpack, he can equip 2 more items. Almost every item will have durability to make the gameplay more challenging.

---

## Weather

This is no big deal. We won't have certain seasons, but we will have cloudy, rainy, stormy weathers.

* Cloudy weather: This type is the usual, boring weather.
* Rainy weather: With this type of weather player better have a shelter.
* Stormy weather: Again player wants to stay in the shelter.

---

## Animals

They will have health and they are considered to be armorless.

**Unfriendly Animals**
* Wolf - 8 Hit Point - Damage 200 Hit Points
* Snake - 4 Hit Point - Damage 100 Hit Points - Getting poisoned with 20% chance
* Bear - 20 Hit Point - Damage 400 Hit Points
* Wasp - 4 Hit Point - Damage 50 Hit Points
* Spider
* Scorpion

**Neutral Animals**
* Bee - They cannot be cultivated or killed. From their hive, beeswax and honey can be gathered.
* Rabbit - 2 Hit Point - Don't fight back.
* Turtle - 1 Hit Point - Don't fight back.


---

## Raw Materials

* Branch
* Leaf
* Stone
* Beeswax
* Hemp

---

## Actions That Can Be Done in Phases:

### Explore: You look for things or places to go. This is going to be one of the first things you are able to do. Rarely you find relics.

**What does explore button do?**

* Possibility of finding new places. - _For this, I now have this feeling that we shouldn't create many random places to go. Instead we should have a couple of places to go according to our storyline, that's why we should make them hard to find for the sake of playtime._ For example, we could increase this chance from 1% to 10% every day and stop increasing it.
* Possibility of finding interesting stuff related to the story.
* Possibility of finding something that is already made. Like an axe. For now, let's say 5%.

### Search: Twigs, small rocks etc.

**What does search button do?**

* You find stuff that are necessary to build things. Also when you have an equipped tool, you start to gather extra stuff. For instance, if you have an axe with you, you start to gather wood with every phase you go for picking up things.
* Possibility of finding berries.
* Possibility of finding flowers.
* Possibility of finding mushrooms.

### Craft: You craft stuff that are necessary to survive. This is probably not going to be a button but a page.

**What can be crafted?**

Tools:
* Axe - Used for gathering wood.
    * Requirements = 1 Stone, 2 Branch, 1 Hemp
    * Durability = 10 Woods
* Spear - Used for killing animals.
    * Requirements = 2 Stone, 2 Branch, 2 Hemp
    * Durability = Contact with 4 animals.
* Knife - Used for killing animals.
    * Requirements = 1 Stone, 1 Branch, 1 Hemp
    * Durability = Contact with 4 animals.
* Bow and arrow- Used for killing animals.
    * Requirements = 5 Branch, 3 Wood, 1 Beeswax
    * Durability = 10 Damage.
* Fishing rod - Used for catching fish.
    * Requirements = 3 Branch, 3 Hemp
    * Durability = 5 Fish
* Torch - Used for protection from animals. Used for travelling at nighttime. Also reduces the chance of falling down at night 5%.
    * Requirements = 1 Branch, 1 Bee Wax
    * Durability = 1 travel at night.
* Trap - Used for catching animals.
    * Requirements = 3 Branch, 2 Leaf
    * Durability = 5 animals
* Outfit - Resistance to animal attacks.
    * Requirements = 3 Branch, 2 Hemp, 3 Wood
    * Durability = 5 animal attacks.
* Camouflage Outfit - Reduces the chance of animal attacks by 3%.
    * Requirements = 3 Branch, 2 Hemp, 5 Leaf, 3 Wood
    * Durability = 5 animal attacks.
* Campfire - Increases the chance of animal attack %10, but keeps the player warm.
    * Requirements = 3 Stone, 3 Woods, 1 Beeswax
    * Durability = 2 nights
* Compass - Decreases the chance of getting lost.
    * Requirements = 4 Branch, 4 Hemp, 4 Beeswax
    * Durability - None
* Bed - Increases energy restoration by each turn.
    * Requirements = 10 Leaf, 5 Hemp, 8 Branch
    * Durability = Can be used 10 times.
* Shelter - Decreases the chance of animal attack 5%.
    * Requirements = 5 Wood, 5 Branch, 1 Shaped Stone _(Created with 2 Stones and 2 Branches)_
    * Durability = 5 nights
* Backpack - 2 more items can be equipped.
    * Requirements = 4 Branch, 2 Hemp
    * Durability = 10 Travels. - _We will put a percentage on the main screen so the player will know about the durability of the bag. If durability finishes on the journey, half of the collected stuff will be lost._
* Cooking Pot - Requires campfire and is used for cooking animals.
    * Requirements = 2 Shaped Stone, 3 Wood
    * Durability = 6 cooking.

We need to categorize them as "tools", "survival" etc. but if we don't have many things to categorize, then we can leave it be.

**Hunting:** This option will probably be active after the player makes a spear. For now, we have no further information.

---

## Unanswered Questions:

*  Most important question is why would anyone want to play our game?
*  ~~Does the protagonist have a story?~~ - Yes, but at the same time we don't want to easily end the game. It should either take many hours or continue forever with the small stories it has inside it. I need ideas here. Only yours.
*  How does the game end? Or will it end at all?
*  What are the relics that can be found during exploration?
*  Is cooking possible?
