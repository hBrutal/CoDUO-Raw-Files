// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
/*QUAKED actor_axis_waffen_soldier_kar98k_pavlovsniper (1.0 0.25 0.0) (-16 -16 0) (16 16 72) SPAWNER FORCESPAWN UNDELETABLE NOENEMYINFO
defaultmdl="xmodel/waffenSS_soldier"
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
	self.weapon = "kar98k_pavlovsniper";
	self.secondaryweapon = "luger";
	self.grenadeWeapon = "Stielhandgranate";
	self.scariness = 1;
	self.bravery = 50;
	self.grenadeAmmo = 0;

	switch(randomint(3))
	{
	case 0:
		character\waffenSS_soldier_mp44a::main();
		break;
	case 1:
		character\waffenSS_soldier_mp44b::main();
		break;
	case 2:
		character\waffenSS_soldier_mp44c::main();
		break;
	}
}

spawner()
{
	self setspawnerteam("axis");
}

precache()
{
	character\waffenSS_soldier_mp44a::precache();
	character\waffenSS_soldier_mp44b::precache();
	character\waffenSS_soldier_mp44c::precache();

	precacheItem("kar98k_pavlovsniper");
	precacheItem("luger");
	precacheItem("Stielhandgranate");
}
