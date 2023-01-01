
/////////////////////////////////  // New correct skies shaders
textures/skies/bastogne1
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/bastogne1 512 -
	sunfile hurtgen
	nofog
	
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/bastogne_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}
}

textures/skies/bastogne2
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foynight 512 -
	sunfile bastogne2
	nofog

	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/bastogne2_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}
}

textures/skies/foy
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foy 512 -
	sunfile hurtgen
}

textures/skies/noville
{
	qer_editorimage textures/skies/noville_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/noville 512 -
	nofog
	
	{
		requires cvar scr_gmi_fast == 0
		map textures/skies/noville_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}
}

textures/skies/bomber
{
	qer_editorimage textures/skies/bomber_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/bomber 512 -
	sunfile bomber
}

textures/skies/trainbridge
{
	qer_editorimage textures/skies/trainbridge_up.tga
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foynight 512 -
	sunfile powcamp

	//{	
	//	map textures/skies/bastogne2_clouds.tga
	//	blendfunc gl_src_alpha gl_one_minus_src_alpha
	//	blendfunc filter
	//	tcMod scroll 0.004 0.004
	//	tcmod scale 3 3
	//}
}




/////////////////////////////////     // Old "busted" shaders

textures/sky/trenches
{
//	nomipmaps
//	nopicmips
	qer_editorimage textures/skies/trenches_up.tga
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/trenches 512 -
	sunfile trenches
	nofog
	
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/trenches_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.003 -0.005
		tcmod scale 3 3
	}	
}

textures/sky/mp_arnhem
{
	qer_editorimage textures/skies/arnhem_clouds.tga
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/bastogne1 512 -
	sunfile mp_hurtgen

//	skyParms env/trenches 512 -
//	sunfile trenches

//	skyParms env/mparnhem 256 -
//	sunfile mp_carentan
//	{
//		map textures/skies/arnhem_clouds.tga
//		blendfunc gl_src_alpha gl_one_minus_src_alpha
//		tcMod scroll 0.001 0.001
//		tcmod scale 3 3
//	}	
}

textures/sky/bomber
{
	qer_editorimage textures/skies/bomber_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/bomber 512 -
	sunfile bomber
}

textures/sky/foy
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foy 512 -
	sunfile hurtgen
}
textures/sky/foynight
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foynight 512 -
	sunfile foynight
	//{	
	//	map textures/skies/mp_berlin_clouds.tga
	//	blendfunc gl_src_alpha gl_one_minus_src_alpha
	//	blendfunc filter
	//	tcMod scroll 0.005 0.005
	//	tcmod scale 3 3
	//}
}

textures/sky/moonlight
{
	qer_editorimage env/nightsky_up.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/black 512 -
}

textures/sky/kharkov1
{
	qer_editorimage textures/skies/kharkov1_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/kharkov1 512 -
	nofog
	
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/Kharkov_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}	
}

textures/sky/kharkov2
{
	qer_editorimage textures/skies/kharkov2_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	nofog

	skyParms env/kharkov2 512 -
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/Kharkov_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha

		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}	

}

textures/sky/mp_kharkov
{
	qer_editorimage textures/skies/kharkov2_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	nofog

	skyParms env/kharkov2 512 -


}
textures/sky/bastogne1
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/bastogne1 512 -
	sunfile hurtgen
	nofog
	
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/bastogne_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}
}

textures/sky/bastogne2
{
	qer_editorimage textures/skies/foy_clouds.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/foynight 512 -
	sunfile bastogne2
	nofog

	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/bastogne2_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.004 0.004
		tcmod scale 3 3
	}
}

textures/sky/mpkursk
{
	qer_editorimage textures/skies/mpkursk_im.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/mpkursk 512 -
}

textures/sky/kursk
{
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/mpkursk 512 -
	nofog
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/bastogne_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		depthFunc equal
	//	blendfunc filter
		tcMod scroll 0.003 0.0052
		tcmod scale 3 3
	}	
}
textures/sky/sicily1
{
	qer_editorimage textures/skies/sicily1_im.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	nofog
	skyParms env/sicily1 512 -
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/sicily1_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.005 0.005
		tcmod scale 3 3
	}	
}
textures/sky/sicily2
{
	qer_editorimage textures/skies/sicily1_im.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	nofog
	skyParms env/sicily1 512 -
	{	
		requires cvar scr_gmi_fast == 0
		map textures/skies/sicily1_clouds.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		tcMod scroll 0.005 0.005
		tcmod scale 3 3
	}
	}	
textures/sky/mpitaly
{
	qer_editorimage textures/skies/mpitaly_im.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/mpitaly 512 -
	//{	
	//	map textures/skies/sicily1_clouds.tga
	//	blendfunc gl_src_alpha gl_one_minus_src_alpha
	//	blendfunc filter
	//	tcMod scroll 0.005 0.005
	//	tcmod scale 3 3
	//}
}
textures/sky/mpsicily
{
	qer_editorimage textures/skies/sicily2_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/mpsicilysky 512 -
	sunfile mp_sicily
	//{	
	//	map textures/skies/sicily1_clouds.tga
	//	blendfunc gl_src_alpha gl_one_minus_src_alpha
	//	blendfunc filter
	//	tcMod scroll 0.005 0.005
	//	tcmod scale 3 3
	//}	
}
textures/skies/mpberlin
{
	qer_editorimage textures/skies/berlin_bk.dds
	surfaceparm sky
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
	skyParms env/mp_berlin 512 -
	sunfile foynight
	//{	
	//	map textures/skies/sicily1_clouds.tga
	//	blendfunc gl_src_alpha gl_one_minus_src_alpha
	//	blendfunc filter
	//	tcMod scroll 0.005 0.005
	//	tcmod scale 3 3
	//}	
}