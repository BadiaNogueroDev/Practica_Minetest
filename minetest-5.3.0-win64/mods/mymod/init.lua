--Sara Badia Noguero
--Alex Pascua Martínez

--Nodo
minetest.register_node("mymod:stone_with_orichalcum", {
	description = S("Orichalcum Ore"),
	tiles = {"default_stone.png^default_mineral_orichalcum.png"},
	groups = {cracky = 3},
	drop = "mymod:orichalcum_lump",
	sounds = default.node_sound_stone_defaults(),
})

--Craft Items
minetest.register_craftitem("mymod:orichalcum_ingot", {
	description = S("Orichalcum Ingot"),
	inventory_image = "default_orichalcum_ingot.png"
})

minetest.register_craftitem("mymod:orichalcum_lump", {
	description = S("Orichalcum Lump"),
	inventory_image = "default_orichalcum_lump.png"
})

--Crafteo Lingote
minetest.register_craft({
	type = "cooking",
	output = "mymod:orichalcum_ingot",
	recipe = "mymod:orichalcum_lump",
})

--Crear herramientas
minetest.register_craft({
		output = "mymod:pick_orichalcum",
		recipe = {
			{"mymod:orichalcum_ingot", "mymod:orichalcum_ingot", "mymod:orichalcum_ingot"},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})

minetest.register_craft({
  output = "mymod:shovel_orichalcum",
  recipe = {
    {"mymod:orichalcum_ingot"},
    {"group:stick"},
    {"group:stick"}
  }
})

minetest.register_craft({
  output = "mymod:axe_orichalcum",
  recipe = {
    {"mymod:orichalcum_ingot", "mymod:orichalcum_ingot"},
    {"mymod:orichalcum_ingot", "group:stick"},
    {"", "group:stick"}
  }
})

minetest.register_craft({
  output = "mymod:sword_orichalcum",
  recipe = {
    {"mymod:orichalcum_ingot"},
    {"mymod:orichalcum_ingot"},
    {"group:stick"}
  }
})

--Herramientas
minetest.register_tool("default:pick_orichalcum", {
	description = S("Orichalcum Pickaxe"),
	inventory_image = "default_tool_orichalcumpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("default:shovel_orichalcum", {
	description = S("Orichalcum Shovel"),
	inventory_image = "default_tool_orichalcumshovel.png",
	wield_image = "default_tool_orichalcumshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("default:axe_orichalcum", {
	description = S("Orichalcum Axe"),
	inventory_image = "default_tool_orichalcumaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("default:sword_orichalcum", {
	description = S("Orichalcum Sword"),
	inventory_image = "default_tool_orichalcumsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

--Spawn del mineral
minetest.register_ore({
  ore_type       = "scatter",
  ore            = "default:stone_with_orichalcum",
  wherein        = "default:stone",
  clust_scarcity = 8 * 8 * 8,
  clust_num_ores = 9,
  clust_size     = 3,
  y_max          = 31000,
  y_min          = 1025,
})

minetest.register_ore({
  ore_type       = "scatter",
  ore            = "default:stone_with_orichalcum",
  wherein        = "default:stone",
  clust_scarcity = 8 * 8 * 8,
  clust_num_ores = 8,
  clust_size     = 3,
  y_max          = 64,
  y_min          = -127,
})

minetest.register_ore({
  ore_type       = "scatter",
  ore            = "default:stone_with_orichalcum",
  wherein        = "default:stone",
  clust_scarcity = 12 * 12 * 12,
  clust_num_ores = 30,
  clust_size     = 5,
  y_max          = -128,
  y_min          = -31000,
})