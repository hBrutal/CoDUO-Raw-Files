// 
// Ukraine Campaign Shader
// Updated 12/22/03 By Mr. Lake
//


// =============== //
// Terrain shaders //
// =============== //

textures/ukraine/terrain/oldpacked_large_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@oldpacked_large.tga
	{
		map textures/ukraine/terrain/dirt@oldpacked_large
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/riverbed_cl_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@riverbed_cl.tga
	{
		map textures/ukraine/terrain/dirt@riverbed_cl
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/riverwall_cl_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@riverwall_cl.tga
	{
		map textures/ukraine/terrain/dirt@riverwall_cl
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/trench_goundalt2_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@trench_goundalt2.tga
	{
		map textures/ukraine/terrain/dirt@trench_goundalt2
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/trench_goundbase_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@trench_goundbase.tga
	{
		map textures/ukraine/terrain/dirt@trench_goundbase
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/deadgrass_cl_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@deadgrass_cl.tga
	{
		map textures/ukraine/terrain/grass@deadgrass_cl
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/deadgrass_dirt_cl_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@deadgrass_dirt_cl.tga
	{
		map textures/ukraine/terrain/grass@deadgrass_dirt_cl
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/straw_dirt_cl_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@straw_dirt_cl.tga
	{
		map textures/ukraine/terrain/grass@straw_dirt_cl
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}


textures/ukraine/terrain/lp_brecort1_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@lp_brecort1.tga
	{
		map textures/ukraine/terrain/grass@lp_brecort1
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/k_rubble1_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@k_rubble1.dds
	{
		map textures/ukraine/terrain/dirt@k_rubble1
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/r_rubble2_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@r_rubble2.dds
	{
		map textures/ukraine/terrain/dirt@r_rubble2
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

// =============== //
// Fix COD shaders //
// =============== //

textures/ukraine/transparents/facade_tiler1_k
{
	qer_editorimage textures/sfx/facade_tiler1.dds
	{
		map clamp textures/sfx/facade_tiler1
		rgbGen identity
		alphaGen vertex
		alphaFunc GE128
		depthWrite
	nextbundle
		map $lightmap
	}
}

textures/ukraine/transparents/facade_tiler1top_k
{
	qer_editorimage textures/sfx/facade_tiler1top.dds
	{
		map clamp textures/sfx/facade_tiler1top
		rgbGen identity
		alphaGen vertex
		alphaFunc GE128
		depthWrite
	nextbundle
		map $lightmap
	}
}

textures/ukraine/transparents/facade_tiler2_k
{
	qer_editorimage textures/sfx/facade_tiler2.dds
	{
		map clamp textures/sfx/facade_tiler2
		rgbGen identity
		alphaGen vertex
		alphaFunc GE128
		depthWrite
	nextbundle
		map $lightmap
	}
}

textures/ukraine/transparents/facade_tiler2top_k
{
	qer_editorimage textures/sfx/facade_tiler2top.dds
	{
		map clamp textures/sfx/facade_tiler2top
		rgbGen identity
		alphaGen vertex
		alphaFunc GE128
		depthWrite
	nextbundle
		map $lightmap
	}
}