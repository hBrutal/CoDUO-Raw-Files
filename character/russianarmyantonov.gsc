// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
main()
{
	self setModel("xmodel/character_soviet_general");
	self attach("xmodel/head_ingram");
	self.hatModel = "xmodel/sovietequipment_officercap";
	self attach(self.hatModel);
	self attach("xmodel/gear_russian_commisar");
	self.voice = "russian";
}

precache()
{
	precacheModel("xmodel/character_soviet_general");
	precacheModel("xmodel/head_ingram");
	precacheModel("xmodel/sovietequipment_officercap");
	precacheModel("xmodel/gear_russian_commisar");
}
