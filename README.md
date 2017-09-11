# Heroes of Might & Magic, Savegame Editor

It's quite simple saved game editor. Data from saved game file is spread to
pages. First page contains info about all players, the second page is used
for searcging and editing hero data.

Players Page.
On first page you can find infomation about players. In most cases Player 1
is the one you play, but we can also reset computer's gold. For each player
following features can be edited: Crystals, Gems, Lumber, Mercury, Ore,
Sulfer and Gold. These resources are sued for buying spells, artifacts and
hiring heroes. Maximum values for resources are 2,147,483,647 what should be 
enough for most lazy players :-) I must admit that it's impossible to finish
some scenarios without cheats so I use this program in "real" life.

Heroes Page.
My guess is that number of heroes is constant but I didn't put all name
to one listbox. You must enter hero name in edit box and press Search button.
Be aware, some heroes have two names, short and long, you try both if program
cannot find a hero. For example if we want hero named "Kastore" we can enter
his full name or just a part ("Kas"). After pressing Search button data of
hero with most matching name will be displayed on this page. Next search or
page changing will store changes.
