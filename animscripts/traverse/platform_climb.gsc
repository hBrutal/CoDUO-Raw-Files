// platform_climb.gsc
// Makes the character climb up onto a 56 unit high platform

#using_animtree ("generic_human");

main()
{
	// do not do code prone in this script
	self.desired_anim_pose = "crouch";
	animscripts\utility::UpdateAnimPose();
	
	self.old_anim_movement = self.anim_movement;
	self.old_anim_alertness = self.anim_alertness;
	
	self endon("killanimscript");
	self traverseMode("nogravity");
	self traverseMode("noclip"); // So he doesn't get stuck if the wall is a little too high
	self setFlaggedAnimKnoballRestart("diveanim",%climbstation_platform_p, %body, 1, .1, 1);
	self animscripts\shared::DoNoteTracks("diveanim");
	self traverseMode("gravity");

	self.anim_movement = self.old_anim_movement;
	self.anim_alertness = self.old_anim_alertness;

	self setAnimKnobAllRestart(self.anim_crouchrunanim, %body, 1, 0.1, 1);
	thread animscripts\run::MakeRunSounds ( "killSoundThread" );
}
