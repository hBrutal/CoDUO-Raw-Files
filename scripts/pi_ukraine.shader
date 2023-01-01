// 
// Pi Studios Ukraine Campaign Shader
// Covers Shaders for Ponyri, Kursk, and MP_Ponyri
// Updated 07/22/04 by David Mertz
//
// NOTE: This can be integrated into the scripts\gmi_ukraine.shader file if necessary


// =============== //
// Terrain shaders //
// =============== //

textures/ukraine/terrain/grass_ponyri_01_blend
{
	surfaceparm grass
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/grass@ponyri_01.dds
	{
		map textures/ukraine/terrain/grass@ponyri_01
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/dirt_kursk_dirt2_blend
{
	surfaceparm dirt
	surfaceparm noncolliding
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@kursk_dirt2.dds
	{
		map textures/ukraine/terrain/dirt@kursk_dirt2.dds
		rgbGen exactVertex
		alphagen vertex
		blendFunc blend
	nextbundle
		map $lightmap
		blendFunc filter
	}
}

textures/ukraine/terrain/kursk_riverbed
{
	polygonOffset
	qer_editorimage textures/ukraine/terrain/dirt@riverbed_cl.dds	
	surfaceparm ice
	{
		map textures/ukraine/terrain/dirt@riverbed_cl
		rgbGen exactVertex
	}
	{
		map $lightmap
		blendFunc filter
	}
}


// ================ //
// Treeline shaders //
// ================ //

// Ponyri reduced memory size tree shaders/textures with settings geared towards vert coloring

textures/ukraine/foliage/treeline_01_fb_p
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage_clamp@treeline_01_p.dds
	{
		map textures/ukraine/foliage/foliage_clamp@treeline_01_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle					
		map $whiteimage
	}
}

textures/ukraine/foliage/single_trees_01_fb_p
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage_clamp@single_trees_01_p.dds
	{
		map textures/ukraine/foliage/foliage_clamp@single_trees_01_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

textures/ukraine/foliage/2048_treeline_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage_clamp@2048_treeline.dds
	{
		map textures/ukraine/foliage/foliage_clamp@2048_treeline.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle					
		map $whiteimage
	}
}

textures/ukraine/foliage/2048_single_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage_clamp@2048_single.dds
	{
		map textures/ukraine/foliage/foliage_clamp@2048_single.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}
	
// this treeline has been clinically proven to be 45% better for your health
textures/ukraine/foliage/treeline_green_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant #1 based on treeline_green_fb
textures/ukraine/foliage/treeline_green_2_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_2_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_2_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant
textures/ukraine/foliage/treeline_green_3_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_3_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_3_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}


// Kursk treeline variant
textures/ukraine/foliage/treeline_green_4_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_4_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_4_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant
textures/ukraine/foliage/treeline_green_5_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_5_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_5_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant
textures/ukraine/foliage/treeline_green_6_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_6_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_6_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant
textures/ukraine/foliage/treeline_green_7_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_7_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_7_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk treeline variant
textures/ukraine/foliage/treeline_green_8_fb
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage@treeline_green_8_p.dds
	{
		map textures/ukraine/foliage/foliage@treeline_green_8_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}

// Kursk single tree variant
textures/ukraine/foliage/single_trees_green_p
{
	surfaceparm foliage
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/ukraine/foliage/foliage_clamp@single_trees_green_p.dds
	{
		map textures/ukraine/foliage/foliage_clamp@single_trees_green_p.dds
		rgbGen Vertex
		alphaFunc GE128
		depthWrite
	  nextbundle
		map $whiteimage
	}
}


// ============= //
// Sky shaders   //
// ============= //

textures/sky/mpponyri
{
	qer_editorimage textures/skies/mpkursk_im.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/trenches 512 -
}


// ============= //
// Water shaders //
// ============= //

// Based on sicily water

textures/sfx/kursk_water
{
//	qer_editorimage env/watercolor_dn
	tessSize 512
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	surfaceparm noshadow
	polygonoffset  // so not to zfight with sand under it
	sort water
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_ATI_fragment_shader
		map textures/sfx/damwater.jpg
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcMod Scroll .05 0
		tcMod scale 4 4
		rgbGen exactVertex
	nextbundle
		map $lightmap
	}
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_ATI_fragment_shader
		map textures/sfx/damwateroverlay.jpg
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcMod scroll -0.01 .01
		tcMod scale 2 2
		tcMod turb 1.03 0.2 1.03
		rgbGen exactVertex
		blendFunc add
	nextbundle
		map textures/sfx/damwateroverlay.jpg
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcMod scroll 0.02 .02
		tcMod scale 4 4
		tcMod turb 0.01 0.2 0.03
	}
	{
		requires GL_MAX_TEXTURE_UNITS_ARB >= 4
		requires GL_NV_texture_shader
		requires GL_ARB_texture_cube_map
		requires GL_NV_register_combiners

		// img_width   img_height   world_width   world_height   wind_vel   wind_dir_x   wind_dir_y   wave_amplitude
		waterMap	64 64   37 37    76 1 0   .06
		rgbGen vertex
//		alphaGen vertex
		alphaGen const .8
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolor
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/sicily2water
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_3of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_3of3(expand tex0)

		nvRegCombiners
		{
			{
				rgb
				{
					discard = tex2 * unsigned_invert(tex3.a);
					discard = tex3 * tex3.a;
					spare0 = sum();
				}
			}
			{
				rgb
				{
					spare0 = spare0 * col0;
				}
			}
			out.rgb = lerp(fog.a, spare0, fog);
			out.a = col0.a;
		}
	}
	{
		requires ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB >= 4
		requires GL_ATI_fragment_shader
		requires GL_ARB_texture_cube_map

		// img_width   img_height   world_width   world_height   wind_vel   wind_dir_x   wind_dir_y   wave_amplitude
		waterMap	64 64   37 37    76 1 0   .06
		rgbGen vertex
		// alphaGen vertex
		alphaGen const .8 
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen vertexToEye
	nextbundle
		cubemap env/watercolor
	nextbundle
		cubemap env/sicily2water

		atiFragmentShader
		{
			//*****************************************************************************
			// phase 0

			//-------------------------------------
			// routing section

			r0 = tex(tc0);	// r0 = bumpmap surface normal
			r1 = tex(tc1);	// r1 = normalized eye-to-point direction vector in world space

			//-------------------------------------
			// operation section
			// need to calculate lookup vectors for the reflection cube map and the diffuse cube map in surface-local space
			// The diffuse cubemap vector is merely the surface normal from the bumpmap (ie, r0) rotated into world space
			// The specular vector is the world space eye vector reflected around the world space normal vector.
			// E + 2 (((E . N) N) / (N . N) - E) = 2 ((E . N) / (N . N)) N - E = (2 (E . N) N - (N . N) E) / N . N

			// do this only if the shader is in world coordinates and has no vertex deformation
			// reflect eye vector in world space
			r3 = dot3(r1 * 2 - 1, r0 * 2 - 1);	// r3 = E . N
			r3 = mul(r3, r0 * 2 - 1);			// r3 = (E . N) N
			r3 = sub(r3 * 2, r1 * 2 - 1);		// r3 = 2 (E . N) N - E = reflection vector

			//*****************************************************************************
			// phase 1

			//-------------------------------------
			// routing section

			r2 = tex(r2);	// r2 = diffuse color
			r3 = tex(r3);	// r3 = specular color + fresnel alpha

			//-------------------------------------
			// operation section
			// need to store r0.rgba with the color and alpha

			r0 = lerp(r3.a, r3, r2);
			r0 = mul(r0, col0);
			r0.a = mov(col0.a);
		}
	}
}