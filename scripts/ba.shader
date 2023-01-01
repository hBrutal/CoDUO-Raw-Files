/////////////////////////FIRE WINDOW OVERLAY/////////////////////////////////////////////////////////
textures/ardennes/windows/firewindow
{
	surfaceparm glass
	polygonOffset
	{
		map textures/ardennes/windows/firewindow.dds
		rgbgen wave noise 0.4 0.1 0 10
//		rgbGen identityLighting
		blendfunc blend
		depthWrite
	}
}
textures/ardennes/windows/firewindow1
{
	surfaceparm glass
	polygonOffset
	{
		map textures/ardennes/windows/firewindow1.dds
//		rgbGen identityLighting
		rgbgen wave noise 0.4 0.05 0 12
		blendfunc blend
		depthWrite
	}
}

/////////////////////////////////ENGINEER ICON///////////////////////////////////////////////////////
skins/engineer
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/engineer.tga
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/kickme
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/kickme.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/milk
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/milk.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/shoothere
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/shoothere.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/stupid
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/stupid.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}
////////////////////////////////FAKED SHADOW TESTS///////////////////////////////////////////////////
skins/bunker_shadow_test
{
	surfaceparm concrete
	{
		map skins/bunker_shadow_test.dds
		rgbGen lightingDiffuse
		blendfunc blend
		depthWrite
	}
}

skins/bunker_diffuse_test
{
	surfaceparm concrete
	{
		map skins/bunker_diffuse_test.dds
		rgbGen lightingDiffuse
	}
}
///////////////////////////lightbulb stuff///////////////////////////////////////////////////////////
skins/globes_on
{
	surfaceparm glass
	surfaceparm trans
	{
		map skins/globes_on.dds
		rgbGen identityLighting
	}
}

skins/ceil_lamp_on
{
	surfaceparm glass
	surfaceparm trans
	{
		map skins/ceil_lamp_on.dds
		rgbGen identityLighting
	}
}

skins/lightbulb_yllon
{
	surfaceparm glass
	surfaceparm trans
	{
		map skins/lightbulb_yllon.dds
		rgbGen identityLighting
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////FO SHIZZLE NIZZLE FLAGS/////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
skins/ctf_small_flagrope
{
	surfaceparm cloth
	{
		map skins/ctf_small_flagrope.dds
		blendFunc blend
		rgbGen lightingDiffuse
	}
}

skins/ctf_large_flagrope
{
	surfaceparm cloth
	{
		map skins/ctf_large_flagrope.dds
		blendFunc blend
		rgbGen lightingDiffuse
	}
}

skins/flag_flag_neutral
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/flag_flag_neutral.dds
		rgbGen identityLighting
	}
}

skins/flag_flag_us
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/flag_flag_us.dds
		rgbGen identityLighting
	}
}

skins/flag_flag_g
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/flag_flag_g.dds
		rgbGen identityLighting
	}
}

skins/flag_flag_b
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/flag_flag_b.dds
		rgbGen identityLighting
	}
}

skins/flag_flag_r
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/flag_flag_r.dds
		rgbGen identityLighting
	}
}

skins/ctf_flag_g_1
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/ctf_flag_g_1.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/ctf_flag_r_1
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/ctf_flag_r_1.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/ctf_flag_b_1
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/ctf_flag_b_1.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

skins/ctf_flag_us_1
{
	deformVertexes autoSprite
	surfaceparm nomarks
	surfaceparm noshadow
	surfaceparm nonsolid
	surfaceparm nolightmap
	{
		map skins/ctf_flag_us_1.dds
		rgbGen identityLighting
		blendFunc blend		
		depthWrite
	}
}

///////////////////////////////////////////////////////////////////////////////
/////////////////SHADERS FOR BASTOGNE 2 TREELINE//////////////////////////////
/////////////////////////////////////////////////////////////////////////////

textures/belgium/foliage/winter_fir1_b2
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage@winter_fir1.tga
	{
		map textures/belgium/foliage/foliage@winter_fir1.tga
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

textures/belgium/foliage/copse1_b2

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse1.tga
	{
		map textures/belgium/foliage/foliage_snow@copse1.tga
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_c_b2

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_l_b2
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_l.tga

	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_l.tga
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}


textures/belgium/foliage/wintertreeline_r_b2
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/copse2_b2
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse2.tga
	{
		map textures/belgium/foliage/foliage_snow@copse2.tga
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/singletree1_b2
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@singletree1.tga
	{
		map textures/belgium/foliage/foliage_snow@singletree1
		rgbGen const ( 0.25000 0.30000 0.40000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

///////////////////////////////////////////////////////////////////////////////
/////////////////SHADERS FOR BASTOGNE 1 TREELINE DARK/////////////////////////
/////////////////////////////////////////////////////////////////////////////

textures/belgium/foliage/winter_fir1_b1
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage@winter_fir1.tga
	{
		map textures/belgium/foliage/foliage@winter_fir1.tga
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

textures/belgium/foliage/copse1_b1

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse1.tga
	{
		map textures/belgium/foliage/foliage_snow@copse1.tga
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_c_b1

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_l_b1
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_l.tga

	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_l.tga
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}


textures/belgium/foliage/wintertreeline_r_b1
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/copse2_b1
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse2.tga
	{
		map textures/belgium/foliage/foliage_snow@copse2.tga
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/singletree1_b1
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@singletree1.tga
	{
		map textures/belgium/foliage/foliage_snow@singletree1
		rgbGen const ( 0.57500 0.600000 0.700000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
///////////////////////////////////////////////////////////////////////////////
/////////////////SHADERS FOR BASTOGNE 1 TREELINE LIGHT////////////////////////
/////////////////////////////////////////////////////////////////////////////

textures/belgium/foliage/winter_fir1_b1_l
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage@winter_fir1.tga
	{
		map textures/belgium/foliage/foliage@winter_fir1.tga
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

textures/belgium/foliage/copse1_b1_l

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse1.tga
	{
		map textures/belgium/foliage/foliage_snow@copse1.tga
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_c_b1_l

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_l_b1_l
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_l.tga

	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_l.tga
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}


textures/belgium/foliage/wintertreeline_r_b1_l
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/copse2_b1_l
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse2.tga
	{
		map textures/belgium/foliage/foliage_snow@copse2.tga
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/singletree1_b1_l
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@singletree1.tga
	{
		map textures/belgium/foliage/foliage_snow@singletree1
		rgbGen const ( 0.80000 0.800000 0.900000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
///////////////////////////////////////////////////////////////////////////////
/////////////////SHADERS FOR FOY TREELINE//////////////////////////////
/////////////////////////////////////////////////////////////////////////////

textures/belgium/foliage/winter_fir1_foy
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage@winter_fir1.tga
	{
		map textures/belgium/foliage/foliage@winter_fir1.tga
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

textures/belgium/foliage/copse1_foy

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse1.tga
	{
		map textures/belgium/foliage/foliage_snow@copse1.tga
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_c_foy

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_l_foy
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_l.tga

	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_l.tga
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}


textures/belgium/foliage/wintertreeline_r_foy
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/copse2_foy
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse2.tga
	{
		map textures/belgium/foliage/foliage_snow@copse2.tga
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/singletree1_foy
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@singletree1.tga
	{
		map textures/belgium/foliage/foliage_snow@singletree1
		rgbGen const ( 0.4 0.45 0.5 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

///////////////////////////////////////////////////////////////////////////////
/////////////////SHADERS FOR FOY NIGHT TREELINE//////////////////////////////
/////////////////////////////////////////////////////////////////////////////

textures/belgium/foliage/winter_fir1_foyn
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage@winter_fir1.tga
	{
		map textures/belgium/foliage/foliage@winter_fir1.tga
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

textures/belgium/foliage/copse1_foyn

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse1.tga
	{
		map textures/belgium/foliage/foliage_snow@copse1.tga
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_c_foyn

{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_c.dds
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/wintertreeline_l_foyn
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_l.tga

	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_l.tga
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}


textures/belgium/foliage/wintertreeline_r_foyn
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
	{
		map textures/belgium/foliage/foliage_snow@wintertreeline_r.tga
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/copse2_foyn
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@copse2.tga
	{
		map textures/belgium/foliage/foliage_snow@copse2.tga
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}
textures/belgium/foliage/singletree1_foyn
{
	surfaceparm foliage
	surfaceparm nomarks
	surfaceparm nolightmap

	qer_editorimage textures/belgium/foliage/foliage_snow@singletree1.tga
	{
		map textures/belgium/foliage/foliage_snow@singletree1
		rgbGen const ( 0.010000 0.200000 0.300000 )
		alphaFunc GE128
		depthWrite
		nextbundle
		map $whiteimage
	}
}

///////////////////////////////////
//shaders for lit lantern
///////////////////////////////////
skins/light_sprite2
{
	surfaceparm trans
	surfaceparm glass
	surfaceparm noshadow
	deformvertexes autosprite
	{
		map skins/light_sprite2.dds
		//blendfunc blend
		blendfunc add
		//blendfunc GL_SRC_ALPHA GL_ONE
		rgbGen identityLighting
	}
}

skins/lanternglass2
{
	surfaceparm glass
	surfaceparm trans
	{
		map skins/lanternglass2.dds
		alphagen const 0.95
		blendfunc blend
		//rgbgen lightingDiffuse
		rgbGen identityLighting
	}
}

skins/lantern_on2
{
	surfaceparm metal
	//surfaceparm trans
	{
		map skins/lantern_on2.dds
		//alphagen 0.3
		//blendfunc blend
		//rgbgen lightingDiffuse
		rgbGen identityLighting
	}
}

// Shader for mp flags
skins/brit_flag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/brit_flag
		rgbGen lightingDiffuse
	}
}

skins/usa_flag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/usa_flag
		rgbGen lightingDiffuse
	}
}

skins/nazi_flag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/nazi_flag
		rgbGen lightingDiffuse
	}
}

skins/gmi_flag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/gmi_flag
		rgbGen lightingDiffuse
	}
}

skins/ruski_flag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/ruski_flag
		rgbGen lightingDiffuse
	}
}

skins/o_br_msc_mpflag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/o_br_msc_mpflag
		rgbGen lightingDiffuse
	}
}

skins/o_ge_msc_mpflag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/o_ge_msc_mpflag
		rgbGen lightingDiffuse
	}
}

skins/o_us_msc_mpflag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/o_us_msc_mpflag
		rgbGen lightingDiffuse
	}
}

skins/o_rs_msc_mpflag
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/o_rs_msc_mpflag
		rgbGen lightingDiffuse
	}
}

skins/o_us_msc_mpflag2
{
	surfaceparm cloth
	cull none
	deformVertexes flap s 2 sin 2 3 0 1.5
	{
		map skins/o_us_msc_mpflag2
		rgbGen lightingDiffuse
	}
}

//////////////////////////////////////////////////
/////////shader for dinner plate in Noville//////
////////////////////////////////////////////////
skins/platenfood
{
	cull none
	{
		map skins/platenfood.dds
		rgbGen lightingDiffuse
	}
}

//////////////////////////////////////////////////
/////////shader for mess kit in Noville//////
////////////////////////////////////////////////
skins/german_mess_kit
{
	cull none
	{
		map skins/german_mess_kit.dds
		rgbGen lightingDiffuse
	}
}

///////////////////////////////////////////////////
///////////candle flame shader/////////////////////
///////////////////////////////////////////////////
skins/candl01
{
	deformVertexes autoSprite2
	surfaceparm nomarks
	surfaceparm nolightmap
	{
		animMap 8
		map skins/candl01.dds 
		map skins/candl02.dds 
		map skins/candl03.dds 
		map skins/candl04.dds 
		map skins/candl05.dds 
		map skins/candl06.dds 
		map skins/candl07.dds 
		map skins/candl08.dds 
		blendFunc GL_SRC_ALPHA GL_ONE
		rgbGen wave sawtooth 0 1 0 8
	}
	{
		animMap 8
		map skins/candl01.dds 
		map skins/candl02.dds 
		map skins/candl03.dds 
		map skins/candl04.dds 
		map skins/candl05.dds 
		map skins/candl06.dds 
		map skins/candl07.dds 
		map skins/candl08.dds 
		blendFunc GL_SRC_ALPHA GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 8
	}
	{
		map textures/sfx/flameball.dds
		blendFunc GL_SRC_ALPHA GL_ONE
		rgbGen wave sin .6 .2 0 .6
	
	}
}

//////////////////////////////////////////////////
/////////shader for candle//////
////////////////////////////////////////////////
skins/moltencandle
{
	{
		map skins/moltencandle.dds
		rgbGen lightingDiffuse
	}
}