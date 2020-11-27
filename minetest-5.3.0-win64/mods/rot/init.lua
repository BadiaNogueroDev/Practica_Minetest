--Sara Badia Noguero
--Alex Pascua Martínez

--Nodo
minetest.register_node("rot:dirt", {
	description = "Rot",
	tiles = {"default_rot.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("rot:purgator", {
	description = "Purgator",
	tiles = {"default_purgator.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

--Crear rot
minetest.register_abm({
 nodenames = {"default:dirt"},
 interval = 60.0,
 chance = 500,
 action = function(pos, node, active_object_count, active_object_count_wider)
  local pos = {x = pos.x, y = pos.y, z = pos.z}
  minetest.set_node(pos, {name = "rot:dirt"})
 end
})

--Expandir rot
minetest.register_abm{
  label = "Rot spread",
	nodenames = {
    "group:soil",
    "group:crumbly",
    "default:dirt_with_grass",
  },
	neighbors = {"rot:dirt"},
	interval = 10.0,
	chance = 20,
	action = function(pos)
		minetest.set_node(pos, {name = "rot:dirt"})
	end,
}

--Pasar de rot a air
minetest.register_abm({
 nodenames = {"rot:dirt"},
 interval = 8.0,
 chance = 5,
 action = function(pos, node, active_object_count, active_object_count_wider)
  local pos = {x = pos.x, y = pos.y, z = pos.z}
  minetest.set_node(pos, {name = "air"})
 end
})

--LVM para purgar el rot
-- Get content IDs during load time, and store into a local
local c_dirt = minetest.get_content_id("default:dirt")
local c_rot = minetest.get_content_id("rot:dirt")

local function purge_rotdirt(pos, size)
-- Read data into LVM
  local vm = minetest.get_voxel_manip()
  local emin, emax = vm:read_from_map(pos, pos)
  local a = VoxelArea:new{ MinEdge = emin, MaxEdge = emax }
  local data = vm:get_data()
  -- Modify data
  for z = pos.z, pos.z do
    for y = pos.y, pos.y do
      for x = pos.x, pos.x do
        local vi = a:index(x, y, z)
        if data[vi] == c_rot then
          data[vi] = c_dirt
        end
      end
    end
  end
  -- Write data
  vm:set_data(data)
  vm:write_to_map(true)
end

--Detectar los bloques rot para pasarlos a dirt
minetest.register_abm{
  label = "Rot purgator",
	nodenames = {"rot:dirt"},
	interval = 10.0,
	chance = 1,
	action = function(...)
		purge_rotdirt(...)
	end
}