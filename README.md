Player Hash Skin Mod for Minetest
====================================

This mod calculates a hash code of a player's name and chooses a texture for him according to this hash code.
There are 8 skins as default, you can change them by replacing -integer-.png with the skin you want (rename it to -integer-.png).
If you want more than 8 skins, change line 10 in init.lua:
hash = hash%8 to hash = hash%-count of skins-
and add additional skins to the textures folder.


License of source code:
-----------------------
WTFPL, original author: Hiradur

License of textures:
--------------------------------
CC-BY-SA 3.0, original author: Jordach
