/////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// 		   gib paper	      ///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

//paper gib a
skins/m_gib_paper_a
{
	surfaceparm cloth
	cull none
	{
		map skins/m_gib_paper_a.dds
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/m_gib_paperglow_a.dds
		blendFunc add
		rgbgen wave sin 0.85 0.35 .25 .3
	}
}

//paper gib a
skins/m_gib_paper_b
{
	surfaceparm cloth
	cull none
	{
		map skins/m_gib_paper_b.dds
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/m_gib_paperglow_b.dds
		blendFunc add
		rgbgen wave sin 0.85 0.35 .25 .3
	}
}

//paper gib a
skins/m_gib_paper_c
{
	surfaceparm cloth
	cull none
	{
		map skins/m_gib_paper_c.dds
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/m_gib_paperglow_c.dds
		blendFunc add
		rgbgen wave sin 0.85 0.35 .25 .3
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// 		   fire	      ///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////


//Fireplace Logs
skins/o_us_prp_fireplacelog
{
	surfaceparm wood
	{
		map skins/o_us_prp_fireplacelog.dds
		rgbGen lightingDiffuse
	}
	{
		map textures/sfx/o_us_prp_fireplacelogglow.dds
		blendFunc add
		rgbgen wave sin 0.85 0.35 .25 .3
	}
}

//Fireplace ash
skins/o_us_prp_fireplaceash
{
	surfaceparm gravel
	{
		map skins/o_us_prp_fireplaceash.dds
		rgbGen lightingDiffuse
		blendfunc blend
	}
	{
		map textures/sfx/o_us_prp_fireplaceashglow.dds
		blendFunc add
		rgbgen wave Sawtooth 0.1 0.5 .5 5
	}
}

//barrrel oil ash
skins/o_us_prp_barreloil_ash
{
	surfaceparm gravel
	{
		map skins/o_us_prp_barreloil_ash.dds
		rgbGen lightingDiffuse
		blendfunc blend
	}
	{
		map textures/sfx/o_us_prp_barreloil_ashglow.dds
		blendFunc add
		rgbgen wave sin 0.85 0.35 .25 .3
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// 		   misc	      ///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////


//sicily1 shore waves
textures/sfx/wave_shorline_a
{
	polygonoffset
	sort water
        surfaceparm nonsolid
	surfaceparm trans
	surfaceparm noshadow
	qer_editorimage textures/sfx/wave_shoreline_a.dds
    {
	depthfunc equal
	map textures/sfx/wave_shoreline_a.dds
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
	tcMod scroll 0.00 -0.05
//	tcMod scroll 0 0.02
    }
//    {
//	map textures/sfx/wave_shoreline_a.dds
//	blendFunc GL_SRC_ALPHA GL_ONE
//	rgbGen exactvertex
//	tcMod scroll 0.01 -0.04
//    }
    {
	map textures/sfx/wave_shoreline_a.dds
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
//	tcMod scroll -0.01 -0.08
	tcMod scroll 0.03 -0.06
    }
}

textures/sfx/shoreline_ripple_rv
{
    	sort additive
	polygonoffset
     	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm noshadow
	qer_editorimage textures/sfx/shoreline_ripple
    {
	depthfunc less
	map textures/sfx/shoreline_ripple
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
	tcMod scroll 0.00 -0.05
    }
    {
	depthfunc less
	map textures/sfx/shoreline_ripple
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen exactvertex
	tcMod scroll 0.03 -0.06
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// 		   volume lights	      ///////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// I created It see if I could get volume lighting in models
// I had some succuss, but the dds format looked horibble, there was alot of setup involved,
// and it sorted wierd if the player passed through it.  Though it may work someday with more testing :/
//
//
//skins/v_light_sphere_a
//{
//	surfaceparm trans
////	surfaceparm glass
//	surfaceparm noshadow
//	deformvertexes autosprite
//	{
//       		map gfx/efx_assets/atmosphere/v_light_sphere_a.dds
//		blendfunc add
//		rgbGen identityLighting
//	}
//}
//
//skins/v_light_square_a
//{
//	surfaceparm trans
////	surfaceparm glass
//	surfaceparm noshadow
//	deformvertexes autosprite
//	{
//       		map skins/v_light_square_a.dds
//		blendfunc add
//		//rgbGen identityLighting
//		rgbGen const ( 0.3 0.3 0.3 )
//
//	}
//}
//
//skins/v_light_square_b
//{
//	surfaceparm trans
////	surfaceparm glass
//	surfaceparm noshadow
//	deformvertexes autosprite
//	{
//       		map gfx/efx_assets/atmosphere/v_light_square_b.dds
//		blendfunc add
//		rgbGen identityLighting
//	}
//}
//
//skins/v_light_cone_a
//{
//	surfaceparm trans
////	surfaceparm glass
//	surfaceparm noshadow
//	deformvertexes autosprite
//	{
//    		map gfx/efx_assets/atmosphere/v_light_cone_a.dds
//		blendfunc add
//		rgbGen identityLighting
//	}
//}