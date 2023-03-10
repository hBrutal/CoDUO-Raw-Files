// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
/*QUAKED actor_axis_tropical_soldier_mp40 (1.0 0.25 0.0) (-16 -16 0) (16 16 72) SPAWNER FORCESPAWN UNDELETABLE NOENEMYINFO
defaultmdl="xmodel/c_ge_bod_tropical"
"count" -- max AI to ever spawn from this spawner
SPAWNER -- makes this a spawner instead of a guy
FORCESPAWN -- will try to delete an AI if spawning fails from too many AI
UNDELETABLE -- this AI (or AI spawned from here) cannot be deleted to make room for FORCESPAWN guys
NOENEMYINFO -- this AI when spawned will not get a snapshot of perfect info about all enemies
*/
main()
{
	self.team = "axis";
	self.accuracy = 0.2;
	self.health = 100;
	self.weapon = "mp40";
	self.secondaryweapon = "";
	self.grenadeWeapon = "Stielhandgranate";
	self.scariness = 1;
	self.bravery = 50;
	self.grenadeAmmo = 0;

	switch(randomint(3))
	{
	case 0:
		character\German_tropical_mp40a::main();
		break;
	case 1:
		character\German_tropical_mp40b::main();
		break;
	case 2:
		character\German_tropical_mp40c::main();
		break;
	}
}

spawner()
{
	self setspawnerteam("axis");
}

precache()
{
	character\German_tropical_mp40a::precache();
	character\German_tropical_mp40b::precache();
	character\German_tropical_mp40c::precache();

	precacheItem("mp40");
	precacheItem("Stielhandgranate");
}
