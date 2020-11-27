--Sara Badia Noguero
--Alex Pascua Martínez

--Nodos
minetest.register_node("teleport:pad", {
	description = "Pad",
	tiles = {"default_pad.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
  paramtype = "light",
	paramtype2 = "facedir",
  node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.0, 0.5},
				{-0.5, 0.0, 0.0, 0.5, 0.5, 0.5},
			},
		},
  after_place_node = function ()
    local player = minetest.get_player_by_name("singleplayer")
    local inv = player:get_inventory()
    local stack = ItemStack("teleport:command")
    local leftover = inv:add_item("main", stack)
  end
})


minetest.register_craftitem("teleport:command", {
	description = "Command",
	inventory_image = "default_command.png",
  on_use = function(itemstack, user, pointed_thing)
		
	end
})