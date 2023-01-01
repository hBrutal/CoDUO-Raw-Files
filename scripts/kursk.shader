textures/sfx/kursk_river
{
	qer_editorimage textures/sfx/kurskriver
	qer_trans .5
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm noshadow
	sort water
	{
		map textures/sfx/kurskriver.tga
		//rgbGen exactVertex
		rgbGen vertex
		//tcMod transform 1 0 0 1 0 0
		tcMod transform 3 0 0 3 0 0
		//tcMod Scroll 0.20 0.1
		tcMod scroll 0.2 0
		blendFunc blend
	nextbundle
		map $lightmap
	}
	{
		map clampy textures/sfx/pondwaterspray.jpg
		rgbGen constLighting ( .6 .6 .6 )
	//	rgbGen identityLighting
	//	tcMod transform 1 0 0 1 0 -1
		tcMod transform 1 0 0 1 0 -1
	//	tcMod transform 1 0 0 1 0 -3
		tcMod scroll 0.15 0
		tcMod turb 2.03 0.2 1.03
		blendFunc add
	}	
	{
		map clampy textures/sfx/pondwaterspray.jpg
		rgbGen constLighting ( .6 .6 .6 )
	//	rgbGen identityLighting
		tcMod transform 1 0 0 -1 0 0
	//	tcMod transform 1 0 0 -1 0 1
	//	tcMod transform 1 0 0 -1 0 2
		tcMod scroll 0.15 0
		tcMod turb 2.03 0.2 1.03
		blendFunc add
	}	
	{
		map textures/sfx/pondwateroverlay.jpg
		//rgbGen vertex
		rgbGen exactVertex
		//tcMod transform 3 0 0 3 0 0
		tcMod transform 1 0 0 1 0 0
		tcMod turb 2.03 0.2 1.03
		//tcMod scroll 0.2 0
		tcMod Scroll 0.10 0.1
		blendFunc add
	nextbundle
		map textures/sfx/pondwateroverlay.jpg
		tcMod transform 2 0 0 2 0 0
		tcMod turb 0.01 0.2 0.03
		//tcMod scroll -0.4 0
		tcMod scroll 0.15 0
	}
}

textures/sfx/ground/snowycreekbed_COPY
{
	qer_trans .5
//	q3map_globaltexture
	surfaceparm ice
	{
		map textures/belgium/ground/rock@snowycreekbed
		rgbGen exactVertex
	}
	{
		map $lightmap
		blendFunc filter
	}
}

// Based on sicily water

textures/sfx/kursk_water_OLD
{
	qer_editorimage env/watercolor_dn
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
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolor
		tcgen tbn_x
	nextbundle
		cubemap env/sicily2water
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
}