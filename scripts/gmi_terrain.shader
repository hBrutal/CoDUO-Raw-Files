//
// TERRAIN BLEND SHADER EXAMPLE
//
// ==================================================
//
// textures/(campaignname)/(subsetname)/(texturename)
// 
// {
//	surfaceparm grass
//	surfaceparm noncolliding
//	polygonOffset
//	qer_editorimage textures/(campaignname)/(subsetname)/(texturename).dds
//	{
//		map textures/(campaignname)/(subsetname)/(texturename)
//		rgbGen exactVertex
//		alphagen vertex
//		blendFunc blend
//	nextbundle
//		map $lightmap
//		blendFunc filter
//	}
// }
//
// ==================================================
//

//JS 12-17-03
textures/holland/terrain/blend_rubble2b
{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/holland/terrain/rubble2b.tga
	{
		map textures/holland/terrain/rubble2b.tga
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/sand_blend
{
	surfaceparm sand
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/sand@sand.dds
	{
		map textures/mp/terrain/sand@sand
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/sand_wet_a_blend
{
	surfaceparm sand
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/sand@sand_wet_a.dds
	{
		map textures/mp/terrain/sand@sand_wet_a
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/sand_wet_b_blend
{
	surfaceparm sand
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/sand@sand_wet_b.dds
	{
		map textures/mp/terrain/sand@sand_wet_b
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/sand_dirty_blend
{
	surfaceparm sand
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/sand@sand_dirty.dds
	{
		map textures/mp/terrain/sand@sand_dirty
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/grass_dirty_edge_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/grass@grass_dirty_edge.dds
	{
		map textures/mp/terrain/grass@grass_dirty_edge
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/grass_dirty_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/grass@grass_dirty.dds
	{
		map textures/mp/terrain/grass@grass_dirty
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/grass_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/grass@grass.dds
	{
		map textures/mp/terrain/grass@grass
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/mp/terrain/road_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/mp/terrain/dirt@road.dds
	{
		map textures/mp/terrain/dirt@road
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/belgium/ground/lightfill_rubble_blend

{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/belgium/ground/snow@lightfill_rubble.dds
	{
		map textures/belgium/ground/snow@lightfill_rubble
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/belgium/ground/footpath_solid_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/belgium/ground/snow@footpath_solid.dds
	{
		map textures/belgium/ground/snow@footpath_solid
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/normandy/ground/rubble_2a_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/normandy/ground/rock@rubble_2a.dds
	{
		map textures/normandy/ground/rock@rubble_2a
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ardennes/terrain/dirtysnow1_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/belgium/ground/snow@dirtysnow1.dds
	{
		map textures/belgium/ground/snow@dirtysnow1
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/paved_road-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/concrete@paved_road-01.dds
	{
		map textures/italy/terrain/concrete@paved_road-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-04_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/dirt@ground-04.dds
	{
		map textures/italy/terrain/dirt@ground-04.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/grass-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@grass-01.dds
	{
		map textures/italy/terrain/grass@grass-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-02_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@ground-02.dds
	{
		map textures/italy/terrain/grass@ground-02.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-05_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@ground-05.dds
	{
		map textures/italy/terrain/grass@ground-05.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/gravel@ground-01.dds
	{
		map textures/italy/terrain/gravel@ground-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-03_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/gravel@ground-03.dds
	{
		map textures/italy/terrain/gravel@ground-03.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-06_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/mud@ground-06.dds
	{
		map textures/italy/terrain/mud@ground-06.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/muddy_road-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/mud@muddy_road-01.dds
	{
		map textures/italy/terrain/mud@muddy_road-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/trail-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/mud@trail-01.dds
	{
		map textures/italy/terrain/mud@trail-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cliff_wall-01_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/rock@cliff_wall-01.dds
	{
		map textures/italy/terrain/rock@cliff_wall-01.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cliff_wall-02_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/rock@cliff_wall-02.dds
	{
		map textures/italy/terrain/rock@cliff_wall-02.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cave_wall-06_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/concrete@cave_wall-06.dds
	{
		map textures/italy/terrain/concrete@cave_wall-06.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-07_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/gravel@ground-07.dds
	{
		map textures/italy/terrain/gravel@ground-07.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-08_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/mud@ground-08.dds
	{
		map textures/italy/terrain/mud@ground-08.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-11_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/mud@ground-11.dds
	{
		map textures/italy/terrain/mud@ground-11.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/beach_sand_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/dirt@beach_sand.dds
	{
		map textures/italy/terrain/dirt@beach_sand.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-09_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@ground-09.dds
	{
		map textures/italy/terrain/grass@ground-09.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-10_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@ground-10.dds
	{
		map textures/italy/terrain/grass@ground-10.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ardennes/terrain/road_noville2_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ardennes/terrain/snow@road_noville2.dds
	{
		map textures/ardennes/terrain/snow@road_noville2
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/grass_yellowgrass_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@yellowgrass.dds
	{
		map textures/ukraine/terrain/grass@yellowgrass
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cliff_wall-04_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/rock@cliff_wall-04.dds
	{
		map textures/italy/terrain/rock@cliff_wall-04.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cliff_wall-03_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/rock@cliff_wall-03.dds
	{
		map textures/italy/terrain/rock@cliff_wall-03.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/dirt2_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@dirt2.dds
	{
		map textures/ukraine/terrain/dirt@dirt2
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/grass_yellowgrass2_blend

{
	surfaceparm snow
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@yellowgrass2.dds
	{
		map textures/ukraine/terrain/grass@yellowgrass2
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-04b_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/dirt@ground-04b.dds
	{
		map textures/italy/terrain/dirt@ground-04b.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/grass-02_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/grass@grass-02.dds
	{
		map textures/italy/terrain/grass@grass-02.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/ground-04b_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/dirt@ground-04b.dds
	{
		map textures/italy/terrain/dirt@ground-04b.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/cliff_wall-03_blend_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/rock@cliff_wall-03_blend.dds
	{
		map textures/italy/terrain/rock@cliff_wall-03_blend.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/italy/terrain/paved_road-04a_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/italy/terrain/concrete@paved_road-04a.dds
	{
		map textures/italy/terrain/concrete@paved_road-04a.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/normandy/ground/hay_blend

{
	surfaceparm rock
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/normandy/ground/wood@hay_pile.dds
	{
		map textures/normandy/ground/wood@hay_pile.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}