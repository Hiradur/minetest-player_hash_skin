minetest.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  local len = string.len(name)
  local hash = 0
 
 	local h = {}
  -- prefix of textures files
	h.sprefix = "player_hash_skin_"
  -- mod providing textures files
	h.smodpath = minetest.get_modpath("player_hash_skin")
  -- start count of texture files
	h.s = 0
  -- number of texture file
	h.n = 8

  for i = 1, len, 1 do
   hash = hash+(string.byte(name,i))
  end
	
  
	-- if simple_skins mod exist, use its skins
	local skinmod = minetest.get_modpath("simple_skins")
	if skinmod ~= nil then
	 	minetest.log("info", "[player_hash_skin] simple_skins mod detected")
		 h.smodpath = minetest.get_modpath("simple_skins")
		 h.sprefix = "character_"
		 h.s = 1
	end

	
	-- loop through the files and count them  
	h.n = h.s
	local fp
	while true do
		fp = io.open(h.smodpath .. "/textures/".. h.sprefix ..h.n.. ".png")
		if not fp then break end
		fp:close()
		h.n = h.n + 1
	end
	-- if count started at 1 need to remove 1
	h.n = h.n - h.s
	
 	minetest.log("info", "[player_hash_skin] "..h.n.." skins found")

	-- hash
 	hash = hash%h.n
 	minetest.log("info", "[player_hash_skin] hash =  "..hash..".")


	-- Open the file (to test its existence)
	local filename = h.smodpath.."/textures/"..h.sprefix..hash
	local f = io.open(filename..".png")
		
	if f then
		f:close()
		local img = h.sprefix.."%i.png"
		default.player_set_textures(player, {string.format(img, hash)})
	end
end)
