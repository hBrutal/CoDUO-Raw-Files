#using_animtree ("generic_human");

main()
{
	// do not do code prone in this script
	self.desired_anim_pose = "stand";
	animscripts\utility::UpdateAnimPose();

	// It'd be nice if I had an animation to get to stand without moving...
	self.anim_movement = "stop";

	turret = self GetTurret();
	turret thread init(self);
	thread animscripts\mg42\common::main(::DoShoot, undefined, ::DoAim, turret);
}

DoShoot(turret)
{
	self setTurretAnim(%standMG42gunner_fire);
	self setAnimKnobRestart(%standMG42gunner_fire, 1, 0.2, 1);

	TurretDoShoot(turret);
}

DoAim(turret)
{
	TurretDoAim(turret);

	self setTurretAnim(%standMG42gunner_aim);
	self setAnimKnobRestart(%standMG42gunner_aim, 1, 0.2, 1);
}

#using_animtree("mg42");

init(owner)
{
	self UseAnimTree(#animtree);

	if (isdefined(self.animTreeUsage))
		self.animTreeUsage++;
	else
		self.animTreeUsage = 0;

	owner waittill("killanimscript"); // code

	if (self.animTreeUsage)
	{
		self.animTreeUsage--;
		return;
	}

	self.animTreeUsage = undefined;

//	self clearanim(%root, 0);

	self stopuseanimtree();
}

TurretDoShoot(turret)
{
	self endon("killanimscript"); // code

	turret endon("turretstatechange"); // code or script
	turret endon("death");

	turret setAnimKnobRestart(%standMG42gun_fire_foward);

	for (;;)
	{
		turret ShootTurret();
		wait 0.1;
	}
}

TurretDoAim(turret)
{
	turret setAnimKnobRestart(%standMG42gun_aim_foward);
}
