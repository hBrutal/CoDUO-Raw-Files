gfx/hud/tankhudhealthbar2
{
	nopicmip
	nomipmaps
	{
		map clamp gfx/hud/redcolorbar_vert.tga
		alphafunc GE128
		rgbGen lightingDiffuse
	}
	
//	{
//		map clamp gfx/hud/redcolorbar_vert.tga
//		alphaGen vertex
//	}
	{
		depthfunc equal
		map $whiteimage
		rgbgen constLighting ( 0.20 0.158 0.062 )
		blendFunc add
	}

	{
		depthfunc equal
		map $whiteimage
		rgbgen constLighting ( 0 1 0  )
		alphaGen wave sin .1 .7 0 1.3
		blendFunc GL_SRC_ALPHA GL_ONE
	}
}
