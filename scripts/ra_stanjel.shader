textures/ra_stanjel/sky/mp_stanjel
{
	qer_editorimage textures/ra_stanjel/sky/stanjel.tga
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/stanjel 1024 -
	sunfile stanjel
}

textures/ra_stanjel/windows/backlit_window
{
	q3map_lightimage textures/ra_Stanjel/windows/backlit_window.blend.tga
	qer_editorimage textures/austria/windows/glass_nosight@barracks_ext.tga
	surfaceparm opaqueglass
	q3map_surfacelight 200
	{
		map textures/austria/windows/glass_nosight@barracks_ext.jpg
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc filter
		rgbGen identity
	}
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 3
		map textures/ra_Stanjel/windows/backlit_window.blend.tga
		blendFunc add
		rgbGen identityLighting
	}
	{
		requires GL_MAX_TEXTURE_UNITS_ARB >= 3
		multiplyImage identityLighting
		map textures/ra_Stanjel/windows/backlit_window.blend.tga
		blendFunc add
		rgbGen identity
	}
	{
		perlight
		map textures/austria/windows/glass_nosight@barracks_ext.jpg
		rgbGen exactVertex
		blendFunc add
	nextbundle
		map $dlight
		blendFunc filter
	}
}

textures/ra_stanjel/ra_metal_clip
{
	qer_trans 0.3
	surfaceparm metal
	surfaceparm clipshot
	surfaceparm nodraw
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm monsterclip
//	surfaceparm ai_nosight
	surfaceparm vehicleclip
	surfaceparm canshootclip
}

textures/ra_stanjel/sfx/simple_water
{
	qer_trans 0.7
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm water
	surfaceparm trans
	{
		map textures/ra_stanjel/sfx/simple_water.tga
		rgbGen exactVertex
		alphaGen const .7
		blendFunc filter
	}
}

textures/ra_stanjel/poolwater
{
	qer_editorimage env/ra_poolcolor_dn
	tessSize 512
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	sort water // (ra) From here and on a bit is a simple water texture, used if you don't have a good enough graphics card.
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_ATI_fragment_shader
		map textures\sfx\mpitalylake.dds
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcMod Scroll .05 0
		tcMod scale 4 4
		rgbGen exactVertex
	nextbundle
		map $lightmap
	}
	{ // (ra) this would be for a more powerfull gfx card. Not ati maybe.
		requires GL_MAX_TEXTURE_UNITS_ARB >= 4
		requires GL_NV_texture_shader
		requires GL_ARB_texture_cube_map
		requires GL_NV_register_combiners

		// img_width   img_height   world_width   world_height   wind_vel   wind_dir_x   wind_dir_y   wave_amplitude
//		waterMap	64 64   37 37    76 1 0   .06 // (ra) sets how big should the waves will be
		waterMap	64 64   37 37    40 1 0   .06 // (ra) sets how big should the waves will be
		rgbGen identitylighting
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/ra_poolcolor
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/ra_pool_env
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen vertexToEye
	nextbundle
		cubemap env/ra_poolcolor
	nextbundle
		cubemap env/ra_pool_env
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/ra_poolcolor
		tcgen tbn_x
	nextbundle
		cubemap env/ra_pool_env
		tcgen tbn_y
	nextbundle
		cubemap $renormalize
		tcgen tbn_z
*/

		atiFragmentShader
		{
			//*****************************************************************************
			// phase 0

			//-------------------------------------
			// routing section

			r0 = tex(tc0);	// r0 = bumpmap surface normal
			r1 = tex(tc1);	// r1 = normalized eye-to-point direction vector in world space
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
			r2 = copy(tc2);	// r2 = Tx,Bx,Nx
			r3 = copy(tc3);	// r3 = Ty,By,Ny
			r4 = copy(tc4);	// r4 = Tz,Bz,Nz
*/

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

/*
// do this only if the shader is not in world coordinates or it has vertex deformation
			// rotate per-pixel normal into world space
			r2.r = dot3(r0 * 2 - 1, r2);
			r2.g = dot3(r0 * 2 - 1, r3);
			r2.b = dot3(r0 * 2 - 1, r4);	// r2 = N

			// reflect eye vector in world space assuming N can be unnormalized
			// N can only be unnormalized if the TBN frame is different for 2 or more vertices of a triangle
			r3 = dot3(r2, r1 * 2 - 1);		// r3 = E . N
			r3 = mul(r3, r2);				// r3 = (E . N) N
			r0 = dot3(r2, r2);				// r0 = N . N
			r0 = mul(r0, r1 * 2 - 1);		// r0 = (N . N) E
			r3 = sub(r3 * 2, r0);			// r3 = 2 (E . N) N - (N . N) E = reflection vector
*/

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
	{
		map $lightmap
		blendFunc filter
	}
}

textures/ra_stanjel/sfx/dove_anim
{
	surfaceparm noncolliding
	surfaceparm nolightmap
	surfaceparm trans
	sort	seethrough
	DeformVertexes autosprite
	qer_editorimage textures/ra_stanjel/sfx/dove1.tga
	{
		animMap 15
		map textures/ra_stanjel/sfx/dove1
		map textures/ra_stanjel/sfx/dove2
		map textures/ra_stanjel/sfx/dove3
		map textures/ra_stanjel/sfx/dove4
		rgbGen exactVertex
		alphaFunc GE128
		depthWrite
	}
}