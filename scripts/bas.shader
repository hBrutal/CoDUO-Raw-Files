gfx/hud/baseassault/bomb_blink
{
	nopicmip
	nomipmaps

	sort 1
	{
		map gfx/hud/baseassault/bomb_blink.dds
		alphagen wave sin 0 1 0 1.5
		blendfunc gl_src_alpha gl_one_minus_src_alpha
	}
}
//------------------------------------------------------------------------------------------------------
baseassault_clockface
{
	nopicmip
	nomipmaps
	sort 1
	{
		map gfx/hud/baseassault/hud@clockface.dds
		blendfunc gl_src_alpha gl_dst_color
	}
}
baseassault_clockfaceneedle
{
	nopicmip
	nomipmaps
	sort 1
	{
		map gfx/hud/baseassault/hud@clockfaceneedle.dds
		alphaFunc GE128
	}
}


