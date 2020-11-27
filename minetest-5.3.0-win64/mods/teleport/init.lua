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
  after_place_node = function (pos)
    local player = minetest.get_player_by_name("singleplayer")
    local inv = player:get_inventory()
    local stack = ItemStack("teleport:command")
    local meta = stack:get_meta()
          meta:set_int("x", pos.x)
          meta:set_int("y", pos.y)
          meta:set_int("z", pos.z)
    local leftover = inv:add_item("main", stack)
  end
})


minetest.register_craftitem("teleport:command", {
	description = "Command",
	inventory_image = "default_command.png",
  on_use = function(itemstack)
		local meta = itemstack:get_meta()
    local pos = {x=meta:get_int("x"), y=meta:get_int("y"), z=meta:get_int("z")}
    local player = minetest.get_player_by_name("singleplayer")
    player:set_pos(pos)
    return itemstack
	end
})