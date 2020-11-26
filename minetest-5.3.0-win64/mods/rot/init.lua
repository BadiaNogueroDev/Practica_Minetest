--Sara Badia Noguero
--Alex Pascua Martínez

--Nodo
minetest.register_node("rot:dirt", {
	description = S("Rot"),
	tiles = {"default_rot.png"},
	groups = {cracky = 3},
	--drop = "rot:orichalcum_lump", --Dropeara algo???
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("rot:purgator", {
	description = S("Purgator"),
	tiles = {"default_stone.png"},
	groups = {cracky = 3},
	--drop = "rot:orichalcum_lump", --Dropeara algo???
	sounds = default.node_sound_stone_defaults(),
})

--ABM LO USAREMOS PARA LA ENFERMEDAD 
--Crear expansion de tierra
minetest.register_abm({
 nodenames = {"default:dirt"},
 interval = 10.0,
 chance = 5,
 catch_up = true, --esto indica si hay que tener en cuenta el tiempo del nodo antes de cargarlo
 action = function(pos, node, active_object_count, active_object_count_wider)
 local pos = {x = pos.x, y = pos.y, z = pos.z}
 minetest.set_node(pos, {name = "rot:dirt"})
 end
})


--LVM LO USAREMOS PARA LA CURA
-- Get content IDs during load time, and store into a local
local c_dirt = minetest.get_content_id("default:dirt")
local c_grass = minetest.get_content_id("default:dirt_with_grass")

local function grass_to_dirt(pos1, pos2)
-- Read data into LVM
  local vm = minetest.get_voxel_manip()
  local emin, emax = vm:read_from_map(pos1, pos2)
  local a = VoxelArea:new{ MinEdge = emin, MaxEdge = emax }
  local data = vm:get_data()
  -- Modify data
  for z = pos1.z, pos2.z do
    for y = pos1.y, pos2.y do
      for x = pos1.x, pos2.x do
        local vi = a:index(x, y, z)
        if data[vi] == c_grass then
          data[vi] = c_dirt
        end
      end
    end
  end
  -- Write data
  vm:set_data(data)
  vm:write_to_map(true)
end