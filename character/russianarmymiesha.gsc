// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
main()
{
	self setModel("xmodel/character_soviet_coat");
	self attach("xmodel/basehead_a_10");
	self.hatModel = "xmodel/sovietequipment_helmet";
	self attach(self.hatModel);
	self.voice = "russian";
}

precache()
{
	precacheModel("xmodel/character_soviet_coat");
	precacheModel("xmodel/basehead_a_10");
	precacheModel("xmodel/sovietequipment_helmet");
}
