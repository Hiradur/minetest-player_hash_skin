minetest.register_on_joinplayer(function(player)
  local name = player:get_player_name()
  local len = string.len(name)
  local hash = 0
  
  for i = 1, len, 1 do
   hash = hash+(string.byte(name,i))
  end
  
  hash = hash%8
   
	local filename = minetest.get_modpath("player_hash_skin").."/textures/"..hash
	local f = io.open(filename..".png")
	
	if f then
		f:close()
		default.player_set_textures(player, {string.format("%i.png", hash)})
	end
end)
