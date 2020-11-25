--Sara Badia Noguero
--Alex Pascua Martínez

--Nodo
minetest.register_node("rot:dirt", {
	description = S("Orichalcum Ore"),
	tiles = {"default_stone.png^default_mineral_orichalcum.png"},
	groups = {cracky = 3},
	drop = "mymod:orichalcum_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("rot:purgator", {
	description = S("Orichalcum Ore"),
	tiles = {"default_stone.png^default_mineral_orichalcum.png"},
	groups = {cracky = 3},
	drop = "mymod:orichalcum_lump",
	sounds = default.node_sound_stone_defaults(),
})

--Crear expansion de tierra
minetest.register_abm({
 nodenames = {"default:dirt"},
 interval = 10.0,
 chance = 10,
 catch_up = true, --esto indica si hay que tener en cuenta el tiempo del nodo antes de cargarlo
 action = function(pos, node, active_object_count, active_object_count_wider)
 local pos = {x = pos.x, y = pos.y + 1, z = pos.z}
 minetest.set_node(pos, {name = "rot:dirt"})
 end
})