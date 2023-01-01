
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////MP_BERLIN WATER//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/mpberlinwater
{
	qer_editorimage textures/sfx/mpberlinwater.dds
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
		map textures/sfx/sewerwater_base.dds
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
		map textures/sfx/sewercrap.dds
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcMod scroll -0.01 .01
		tcMod scale 2 2
		tcMod turb 1.03 0.2 1.03
		rgbGen exactVertex
		blendFunc gl_one gl_one
	nextbundle
		map textures/sfx/sewercrap.dds
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolorberlin
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/berlinwater
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
		cubemap env/watercolorberlin
	nextbundle
		cubemap env/berlinwater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolorberlin
		tcgen tbn_x
	nextbundle
		cubemap env/berlinwater
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
		map textures/sfx/goop.dds
		rgbgen exactvertex
		tcMod Scroll -0.25 0.1
		tcmod scale 1 1
		alphagen wave sin 0.5 0.04 0.33 0.5
		blendfunc gl_src_alpha gl_one_minus_src_alpha
	}
	{
		map textures/sfx/sewercrap.dds
		tcMod scroll -0.50 0
		tcmod scale 1 1
		blendfunc gl_one gl_one
		alphafunc ge128
		rgbgen exactvertex
		depthwrite
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////MP_ARNHEM RIVER WATER////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/arnhemwater
{
	qer_editorimage textures/sfx/arnhemwater.dds
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolorarnhem
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/arnhemwater
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
		cubemap env/watercolorarnhem
	nextbundle
		cubemap env/arnhemwater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolorarnhem
		tcgen tbn_x
	nextbundle
		cubemap env/arnhemwater
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////MP_SICILY WATER///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/mp_sicilywater
{
	qer_editorimage textures/sfx/mp_sicily_water.dds
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
		alphaGen vertex
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
		cubemap env/mpsicilywater
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
		cubemap env/watercolor
	nextbundle
		cubemap env/mpsicilywater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolor
		tcgen tbn_x
	nextbundle
		cubemap env/mpsicilywater
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////MP_RHINEVALLEY LAKE WATER////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/rhinewater
{
	qer_editorimage textures/sfx/rhinewater.dds
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
		waterMap	64 64   37 37    40 1 0   .04
		rgbGen vertex
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolorrhine
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/rhinewater
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
		cubemap env/watercolorrhine
	nextbundle
		cubemap env/rhinewater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolorrhine
		tcgen tbn_x
	nextbundle
		cubemap env/rhinewater
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////TRAINBRIDGE RIVER WATER//////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/trainwater
{
	qer_editorimage textures/sfx/trainriver.dds
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolortrain
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/trainwater
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
		cubemap env/watercolortrain
	nextbundle
		cubemap env/trainwater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolortrain
		tcgen tbn_x
	nextbundle
		cubemap env/trainwater
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////FOY RIVER WATER///////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/foywater
{
	qer_editorimage textures/sfx/foyriver.dds
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolorfoy
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/foywater
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
		cubemap env/watercolorfoy
	nextbundle
		cubemap env/foywater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolorfoy
		tcgen tbn_x
	nextbundle
		cubemap env/foywater
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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////MP_ITALY LAKE WATER///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/mp_italywater
{
	qer_editorimage textures/sfx/mpitalylake.dds
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
		alphaGen vertex
		blendFunc blend
		tcgen vector ( .001953125 0 0 ) ( 0 .001953125 0 )
		tcmod scroll .07 0
	nextbundle
		cubemap $renormalize
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_1of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_1of3(expand tex0)
	nextbundle
		cubemap env/watercolor1
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/mpitalywater
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
		cubemap env/watercolor1
	nextbundle
		cubemap env/mpitalywater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/watercolor1
		tcgen tbn_x
	nextbundle
		cubemap env/mpitalywater
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////LAPPING WATER/WAVES SHADER///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
textures/sfx/wave_shoreline_a

{
	qer_editorimage textures/sfx/wave_shoreline_a.dds
    	sort    additive
	polygonoffset
        surfaceparm nonsolid
	surfaceparm trans
	surfaceparm noshadow
	
    {
	map textures/sfx/wave_shoreline_a.dds
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
	tcMod scroll 0.00 -0.05
    }
    {
	map textures/sfx/wave_shoreline_a.dds
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
	tcMod scroll 0.03 -0.06
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////WATER FOR TRENCHES RIVER//////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

textures/sfx/trencheswater
{
	qer_editorimage env/trencheswatercolor_dn
	tessSize 512
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	sort water
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_ATI_fragment_shader		
		map textures/sfx/kurskwater.jpg
		tcMod Scroll .01 -.01
		tcMod scale 4 4
		rgbGen exactVertex
	nextbundle
		map $lightmap
	}
	{
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_NV_texture_shader || ! GL_NV_register_combiners
		requires GL_MAX_TEXTURE_UNITS_ARB < 4 || ! GL_ATI_fragment_shader
		map textures/sfx/kurskwateroverlay.jpg
		tcMod scroll -0.01 .01
		tcMod scale 2 2
		tcMod turb 1.03 0.2 1.03
		rgbGen exactVertex
		blendFunc add
	nextbundle
		map textures/sfx/kurskwateroverlay.jpg
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
		cubemap env/trencheswatercolor
		tcgen nv_dot_product_reflect_cube_map_eye_from_qs_2of3
		nvTexShader dot_product_cube_map_and_reflect_cube_map_eye_from_qs_2of3(expand tex0)
	nextbundle
		cubemap env/trencheswater
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
		cubemap env/trencheswatercolor
	nextbundle
		cubemap env/trencheswater
/*
// do this only if the shader is not in world coordinates or it has vertex deformation
	nextbundle
		cubemap env/trencheswatercolor
		tcgen tbn_x
	nextbundle
		cubemap env/trencheswater
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