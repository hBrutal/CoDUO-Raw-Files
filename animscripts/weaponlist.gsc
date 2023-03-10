// Weapon configuration for anim scripts.
// Supplies information for all AI weapons.
#using_animtree ("generic_human");

usingFlamethrowerWeapon()
{
	weaponAnims = anim.AIWeapon[self.weapon]["anims"];

	return (weaponAnims == "flamethrower");
}

usingLMGWeapon()
{
	return (anim.AIWeapon[self.weapon]["type"] == "lmg");
}

usingAutomaticWeapon()
{
	return (anim.AIWeapon[self.weapon]["type"] == "auto");
}

usingSemiAutoWeapon()
{
	return (anim.AIWeapon[self.weapon]["type"] == "semi");
}

autoShootAnimRate()
{
	if (usingAutomaticWeapon())
	{
		// The auto fire animation fires 10 shots a second, so we divide the weapon's fire rate by 
		// 10 to get the correct anim playback rate.
		return (anim.AIWeapon[self.weapon]["rate"]) / 10.0;
	}
	else
	{
		println ("weaponList::standAimShootAnims: No auto fire rate for "+self.weapon);
		return 0.2;	// Equates to 2 shots a second, decent for a non-auto weapon.
	}
}

waitAfterShot()
{
	return 0.25;
}

shootAnimTime()
{
	if (usingAutomaticWeapon() || usingLMGWeapon() )
	{
		return ((float)1) / (anim.AIWeapon[self.weapon]["rate"]);
	}
	else
	{
		// We randomize the result a little from the real time, just to make things more 
		// interesting.  In reality, the 20Hz server is going to make this much less variable.
		rand = 0.8 + randomfloat(0.4);
		return (anim.AIWeapon[self.weapon]["time"]) * rand;
	}
}

standAimShootAnims()
{
	weaponAnims = anim.AIWeapon[self.weapon]["anims"];

	if (weaponAnims == "pistol")
	{
		aimarray["aim_down"] =		%pistol_standshoot_down;	// TODO wrong anim
		aimarray["aim_straight"] =	%pistol_standaim_idle;
		aimarray["aim_up"] =		%pistol_standshoot_up;		// TODO wrong anim
		aimarray["shoot_down"] =	%pistol_standshoot_down;
		aimarray["shoot_straight"] =%pistol_standshoot_straight;
		aimarray["shoot_up"] =		%pistol_standshoot_up;
	}
	else if (weaponAnims == "flamethrower")
	{
		aimarray["aim_down"] =		%flamethrower_aim_down;
		aimarray["aim_straight"] =	%flamethrower_aim_straight;
		aimarray["aim_up"] =		%flamethrower_aim_up;
		aimarray["shoot_down"] =	%flamethrower_shoot_down;
		aimarray["shoot_straight"] =%flamethrower_shoot_straight;
		aimarray["shoot_up"] =		%flamethrower_shoot_up;
	}
	else
	{
		weaponType = anim.AIWeapon[self.weapon]["type"];
		switch (weaponType)
		{
		case "auto":
			aimarray["aim_down"] =		%stand_aim_down;
			aimarray["aim_straight"] =	%stand_aim_straight;
			aimarray["aim_up"] =		%stand_aim_up;
			aimarray["shoot_down"] =	%stand_shoot_auto_down;
			aimarray["shoot_straight"] =%stand_shoot_auto_straight;
			aimarray["shoot_up"] =		%stand_shoot_auto_up;
			break;
		case "semi":
			aimarray["aim_down"] =		%stand_aim_down;
			aimarray["aim_straight"] =	%stand_aim_straight;
			aimarray["aim_up"] =		%stand_aim_up;
			aimarray["shoot_down"] =	%stand_shoot_down;
			aimarray["shoot_straight"] =%stand_shoot_straight;
			aimarray["shoot_up"] =		%stand_shoot_up;
			break;
		case "bolt":
			aimarray["aim_down"] =		%stand_aim_down;
			aimarray["aim_straight"] =	%stand_aim_straight;
			aimarray["aim_up"] =		%stand_aim_up;
			aimarray["shoot_down"] =	%stand_shoot_down;
			aimarray["shoot_straight"] =%stand_shoot_straight;
			aimarray["shoot_up"] =		%stand_shoot_up;
			break;
		case "lmg":
			aimarray["aim_down"] =		%stand_aim_down;
			aimarray["aim_straight"] =	%stand_aim_straight;
			aimarray["aim_up"] =		%stand_aim_up;
			aimarray["shoot_down"] =	%stand_shoot_down;
			aimarray["shoot_straight"] =%stand_shoot_straight;
			aimarray["shoot_up"] =		%stand_shoot_up;
			break;
		default:
			println ("weaponList::standAimShootAnims: Unhandled weapon type "+weaponType+"!");
			aimarray["aim_down"] =		%stand_aim_down;
			aimarray["aim_straight"] =	%stand_aim_straight;
			aimarray["aim_up"] =		%stand_aim_up;
			aimarray["shoot_down"] =	%stand_shoot_down;
			aimarray["shoot_straight"] =%stand_shoot_straight;
			aimarray["shoot_up"] =		%stand_shoot_up;
			break;
		}
	}
	return aimarray;
}

crouchAimShootAnims()
{
	weaponAnims = anim.AIWeapon[self.weapon]["anims"];

	if (weaponAnims == "pistol")
	{
		aimarray["aim_down"] =		%pistol_crouchshoot_down;	// TODO wrong anim
		aimarray["aim_straight"] =	%pistol_crouchaim_idle;
		aimarray["aim_up"] =		%pistol_crouchshoot_up;		// TODO wrong anim
		aimarray["shoot_down"] =	%pistol_crouchshoot_down;
		aimarray["shoot_straight"] =%pistol_crouchshoot_straight;
		aimarray["shoot_up"] =		%pistol_crouchshoot_up;
	}
	else if (weaponAnims == "panzerfaust")
	{
		aimarray["aim_down"] =		%panzerfaust_crouchaim_down;
		aimarray["aim_straight"] =	%panzerfaust_crouchaim_straight;
		aimarray["aim_up"] =		%panzerfaust_crouchaim_up;
		aimarray["shoot_down"] =	%panzerfaust_crouchshoot_down;
		aimarray["shoot_straight"] =%panzerfaust_crouchshoot_straight;
		aimarray["shoot_up"] =		%panzerfaust_crouchshoot_up;
	}
	else if (weaponAnims == "bazooka")
	{
		aimarray["aim_down"] =		%panzerfaust_crouchaim_down;
		aimarray["aim_straight"] =	%panzerfaust_crouchaim_straight;
		aimarray["aim_up"] =		%panzerfaust_crouchaim_up;
		aimarray["shoot_down"] =	%panzerfaust_crouchshoot_down;
		aimarray["shoot_straight"] =%panzerfaust_crouchshoot_straight;
		aimarray["shoot_up"] =		%panzerfaust_crouchshoot_up;
	}
	else if (weaponAnims == "panzerschreck")
	{
		aimarray["aim_down"] =		%panzerfaust_crouchaim_down;
		aimarray["aim_straight"] =	%panzerfaust_crouchaim_straight;
		aimarray["aim_up"] =		%panzerfaust_crouchaim_up;
		aimarray["shoot_down"] =	%panzerfaust_crouchshoot_down;
		aimarray["shoot_straight"] =%panzerfaust_crouchshoot_straight;
		aimarray["shoot_up"] =		%panzerfaust_crouchshoot_up;
	}
	else
	{
		weaponType = anim.AIWeapon[self.weapon]["type"];
		switch (weaponType)
		{
		case "auto":
			aimarray["aim_down"] =		%crouch_aim_down;
			aimarray["aim_straight"] =	%crouch_aim_straight;
			aimarray["aim_up"] =		%crouch_aim_up;
			aimarray["shoot_down"] =	%crouch_shoot_auto_down;
			aimarray["shoot_straight"] =	%crouch_shoot_auto_straight;
			aimarray["shoot_up"] =		%crouch_shoot_auto_up;
			break;
		case "semi":
			aimarray["aim_down"] =		%crouch_aim_down;
			aimarray["aim_straight"] =	%crouch_aim_straight;
			aimarray["aim_up"] =		%crouch_aim_up;
			aimarray["shoot_down"] =	%crouch_shoot_down;
			aimarray["shoot_straight"] =%crouch_shoot_straight;
			aimarray["shoot_up"] =		%crouch_shoot_up;
			break;
		case "bolt":
			aimarray["aim_down"] =		%crouch_aim_down;
			aimarray["aim_straight"] =	%crouch_aim_straight;
			aimarray["aim_up"] =		%crouch_aim_up;
			aimarray["shoot_down"] =	%crouch_shoot_down;
			aimarray["shoot_straight"] =%crouch_shoot_straight;
			aimarray["shoot_up"] =		%crouch_shoot_up;
			break;
		case "lmg":
			aimarray["aim_down"] =		%crouch_aim_down;
			aimarray["aim_straight"] =	%crouch_aim_straight;
			aimarray["aim_up"] =		%crouch_aim_up;
			aimarray["shoot_down"] =	%crouch_shoot_auto_down;
			aimarray["shoot_straight"] =	%crouch_shoot_auto_straight;
			aimarray["shoot_up"] =		%crouch_shoot_auto_up;
			break;
		default:
			println ("aim::crouchAimShootAnims: Unhandled weapon type "+weaponType+"!");
			aimarray["aim_down"] =		%crouch_aim_down;
			aimarray["aim_straight"] =	%crouch_aim_straight;
			aimarray["aim_up"] =		%crouch_aim_up;
			aimarray["shoot_down"] =	%crouch_shoot_down;
			aimarray["shoot_straight"] =%crouch_shoot_straight;
			aimarray["shoot_up"] =		%crouch_shoot_up;
			break;
		}
	}
	return aimarray;
}

RefillClip()
{
	[[anim.assert]](isDefined(anim.AIWeapon), "anim.AIWeapon is not defined");
	[[anim.assert]](isDefined(self.weapon), "Self.weapon is not defined for "+self.model);
	[[anim.assert]](isDefined(anim.AIWeapon[self.weapon]), "anim.AIWeapon array is not defined for "+self.weapon);
	[[anim.assert]](isDefined(anim.AIWeapon[self.weapon]["clipsize"]), "anim.AIWeapon[" + self.weapon + "][clipsize] array is not defined");
	self.bulletsInClip = anim.AIWeapon[self.weapon]["clipsize"];
	[[anim.assert]](isDefined(self.bulletsInClip), "RefillClip failed");
}

ClipSize()
{
    if ( self.weapon == "none" )
        return 0;
	return anim.AIWeapon[self.weapon]["clipsize"];
}

// Weapon list
initWeaponList()
{
	anim.AIWeapon["none"]["type"] =			"auto";
	anim.AIWeapon["none"]["rate"] =			8.0;
	anim.AIWeapon["none"]["clipsize"] =		30;
	anim.AIWeapon["none"]["anims"] =		"rifle";

	//German
	anim.AIWeapon["mp40"]["type"] =			"auto";
	anim.AIWeapon["mp40"]["rate"] =			8.0;
	anim.AIWeapon["mp40"]["clipsize"] =		30;
	anim.AIWeapon["mp40"]["anims"] =		"rifle";

	anim.AIWeapon["mp44"]["type"] =			"auto";
	anim.AIWeapon["mp44"]["rate"] =			8.0;
	anim.AIWeapon["mp44"]["clipsize"] =		30;
	anim.AIWeapon["mp44"]["anims"] =		"rifle";

	anim.AIWeapon["FG42"]["type"] =			"auto";
	anim.AIWeapon["FG42"]["rate"] =			13.3;
	anim.AIWeapon["FG42"]["clipsize"] =		20;
	anim.AIWeapon["FG42"]["anims"] =		"rifle";

	anim.AIWeapon["gewehr43"]["type"] =		"semi";
	anim.AIWeapon["gewehr43"]["time"] =		0.4;
	anim.AIWeapon["gewehr43"]["clipsize"] =		8;
	anim.AIWeapon["gewehr43"]["anims"] =		"rifle";

	anim.AIWeapon["kar98k"]["type"] =		"bolt";
	anim.AIWeapon["kar98k"]["time"] =		1.5;
	anim.AIWeapon["kar98k"]["clipsize"] =		5;
	anim.AIWeapon["kar98k"]["anims"] =		"rifle";

	//kar98k_pavlovsniper has super accuracy at any range
	//because the normal weapons have relatively short ranges

	anim.AIWeapon["kar98k_pavlovsniper"]["type"] =		"bolt";
	anim.AIWeapon["kar98k_pavlovsniper"]["time"] =		1.5;
	anim.AIWeapon["kar98k_pavlovsniper"]["clipsize"] =	5;
	anim.AIWeapon["kar98k_pavlovsniper"]["anims"] =		"rifle";

	anim.AIWeapon["kar98k_sniper"]["type"] =	"bolt";
	anim.AIWeapon["kar98k_sniper"]["time"] =	1.5;
	anim.AIWeapon["kar98k_sniper"]["clipsize"] =	5;
	anim.AIWeapon["kar98k_sniper"]["anims"] =	"rifle";

	anim.AIWeapon["panzerfaust"]["type"] =		"bolt";
	anim.AIWeapon["panzerfaust"]["time"] =		3.0;
	anim.AIWeapon["panzerfaust"]["clipsize"] =	1;
	anim.AIWeapon["panzerfaust"]["anims"] =		"panzerfaust";

	anim.AIWeapon["panzerschreck"]["type"] =		"bolt";
	anim.AIWeapon["panzerschreck"]["time"] =		10.0;
	anim.AIWeapon["panzerschreck"]["clipsize"] =		1;
	anim.AIWeapon["panzerschreck"]["anims"] =		"panzerschreck";

	anim.AIWeapon["luger"]["type"] =		"semi";
	anim.AIWeapon["luger"]["time"] =		0.2;
	anim.AIWeapon["luger"]["clipsize"] = 	8;
	anim.AIWeapon["luger"]["anims"] =		"pistol";
	
	anim.AIWeapon["mg34"]["type"] =			"lmg";
	anim.AIWeapon["mg34"]["rate"] =			10.0;
	anim.AIWeapon["mg34"]["clipsize"] =		150;
	anim.AIWeapon["mg34"]["anims"] =		"lmg";

	anim.AIWeapon["flamethrower"]["type"] =		"auto";
	anim.AIWeapon["flamethrower"]["rate"] =		10.0;
	anim.AIWeapon["flamethrower"]["clipsize"] =	500;
	anim.AIWeapon["flamethrower"]["anims"] =	"flamethrower";

	//American
	anim.AIWeapon["BAR"]["type"] =			"auto";
	anim.AIWeapon["BAR"]["rate"] =			9.5;
	anim.AIWeapon["BAR"]["clipsize"] =		20;
	anim.AIWeapon["BAR"]["anims"] =			"rifle";

	//The AI Overlay for squad role title is done in the weapon (bleh!).
	//m1carbine_medic is a custom weapon that is taken away from the Brecourt 
	//medic at the start of the level so he appears as a "Medic" on the player's hud.

	anim.AIWeapon["m1carbine_medic"]["type"] =		"auto";
	anim.AIWeapon["m1carbine_medic"]["rate"] =		9.5;
	anim.AIWeapon["m1carbine_medic"]["clipsize"] =		20;
	anim.AIWeapon["m1carbine_medic"]["anims"] =		"rifle";

	anim.AIWeapon["m1carbine"]["type"] =		"semi";
	anim.AIWeapon["m1carbine"]["time"] =		0.25;
	anim.AIWeapon["m1carbine"]["clipsize"] = 	10;
	anim.AIWeapon["m1carbine"]["anims"] =		"rifle";

	anim.AIWeapon["m1garand"]["type"] =		"semi";
	anim.AIWeapon["m1garand"]["time"] =		0.3;
	anim.AIWeapon["m1garand"]["clipsize"] =		8;
	anim.AIWeapon["m1garand"]["anims"] =		"rifle";

	anim.AIWeapon["springfield"]["type"] =		"bolt";
	anim.AIWeapon["springfield"]["time"] =		1.5;
	anim.AIWeapon["springfield"]["clipsize"] =	5;
	anim.AIWeapon["springfield"]["anims"] =		"rifle";

	anim.AIWeapon["thompson"]["type"] =		"auto";
	anim.AIWeapon["thompson"]["rate"] =		12.0;
	anim.AIWeapon["thompson"]["clipsize"] =		30;
	anim.AIWeapon["thompson"]["anims"] =		"rifle";

	anim.AIWeapon["colt"]["type"] =		"semi";
	anim.AIWeapon["colt"]["time"] =		0.25;
	anim.AIWeapon["colt"]["clipsize"] = 	7;
	anim.AIWeapon["colt"]["anims"] =	"pistol";

	anim.AIWeapon["bazooka"]["type"] =		"bolt";
	anim.AIWeapon["bazooka"]["time"] =		10.0;
	anim.AIWeapon["bazooka"]["clipsize"] =		1;
	anim.AIWeapon["bazooka"]["anims"] =		"bazooka";

	// Since 30cal is already in use by IW the GMI 30cal needs to be called mg30cal

	anim.AIWeapon["mg30Cal"]["type"] =		"lmg";
	anim.AIWeapon["mg30Cal"]["rate"] =		10.0;
	anim.AIWeapon["mg30Cal"]["clipsize"] =		150;
	anim.AIWeapon["mg30Cal"]["anims"] =		"lmg";

	anim.AIWeapon["30cal"]["type"] =		"auto";
	anim.AIWeapon["30cal"]["rate"] =		10.0;
	anim.AIWeapon["30cal"]["clipsize"] =		99999; // Don't reload the 30 cal.
	anim.AIWeapon["30cal"]["anims"] =		"rifle";

	anim.AIWeapon["50cal"]["type"] =		"auto";
	anim.AIWeapon["50cal"]["rate"] =		10.0;
	anim.AIWeapon["50cal"]["clipsize"] =		99999;	// Don't reload the 50 cal.
	anim.AIWeapon["50cal"]["anims"] =		"rifle";

	//British
	anim.AIWeapon["bren"]["type"] =			"auto";
	anim.AIWeapon["bren"]["rate"] =			8.0;
	anim.AIWeapon["bren"]["clipsize"] =		30;
	anim.AIWeapon["bren"]["anims"] =		"rifle";

	anim.AIWeapon["sten"]["type"] =			"auto";
	anim.AIWeapon["sten"]["rate"] =			10.0;
	anim.AIWeapon["sten"]["clipsize"] =		32;
	anim.AIWeapon["sten"]["anims"] =		"rifle";

	anim.AIWeapon["sten_silenced"]["type"] =		"auto";
	anim.AIWeapon["sten_silenced"]["rate"] =		10.0;
	anim.AIWeapon["sten_silenced"]["clipsize"] =		32;
	anim.AIWeapon["sten_silenced"]["anims"] =		"rifle";

	//Another instance of having to use the weapon to change the 
	//squad role overlay, this time on Private Mills in Pegasusnight
	//so he appears as an "Army Engineer"

	anim.AIWeapon["sten_engineer"]["type"] =	"auto";
	anim.AIWeapon["sten_engineer"]["rate"] =	10.0;
	anim.AIWeapon["sten_engineer"]["clipsize"] =	32;
	anim.AIWeapon["sten_engineer"]["anims"] =	"rifle";

	anim.AIWeapon["enfield"]["type"] =		"bolt";
	anim.AIWeapon["enfield"]["time"] =		1.5;
	anim.AIWeapon["enfield"]["clipsize"] =	10;
	anim.AIWeapon["enfield"]["anims"] =		"rifle";

	anim.AIWeapon["webley"]["type"] =		"semi";
	anim.AIWeapon["webley"]["time"] =		0.2;
	anim.AIWeapon["webley"]["clipsize"] = 	6;
	anim.AIWeapon["webley"]["anims"] =		"pistol";

	//Russian
	anim.AIWeapon["ppsh"]["type"] =			"auto";
	anim.AIWeapon["ppsh"]["rate"] =			15.0;
	anim.AIWeapon["ppsh"]["clipsize"] =		71;
	anim.AIWeapon["ppsh"]["anims"] =		"rifle";

	anim.AIWeapon["svt40"]["type"] =		"semi";
	anim.AIWeapon["svt40"]["time"] =		0.4;
	anim.AIWeapon["svt40"]["clipsize"] =		8;
	anim.AIWeapon["svt40"]["anims"] =		"rifle";

	anim.AIWeapon["mosin_nagant"]["type"] =		"bolt";
	anim.AIWeapon["mosin_nagant"]["time"] =		1.5;
	anim.AIWeapon["mosin_nagant"]["clipsize"] =	20;
	anim.AIWeapon["mosin_nagant"]["anims"] =	"rifle";

	anim.AIWeapon["mosin_nagant_sniper"]["type"] =		"bolt";
	anim.AIWeapon["mosin_nagant_sniper"]["time"] =		1.5;
	anim.AIWeapon["mosin_nagant_sniper"]["clipsize"] =	20;
	anim.AIWeapon["mosin_nagant_sniper"]["anims"] =		"rifle";
	
	anim.AIWeapon["tt33"]["type"] =		"semi";
	anim.AIWeapon["tt33"]["time"] =		0.2;
	anim.AIWeapon["tt33"]["clipsize"] = 	8;
	anim.AIWeapon["tt33"]["anims"] =		"pistol";

	anim.AIWeapon["dp28"]["type"] =			"lmg";
	anim.AIWeapon["dp28"]["rate"] =			10.0;
	anim.AIWeapon["dp28"]["clipsize"] =		150;
	anim.AIWeapon["dp28"]["anims"] =		"lmg";
}
