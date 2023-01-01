setVictoryQuote()
{
	victoryquotes[0] = "@VICTORYQUOTE_WHEN_YOU_HAVE_TO_KILL";
	victoryquotes[1] = "@VICTORYQUOTE_BATTLES_ARE_WON_BY_SLAUGHTER";
	victoryquotes[2] = "@VICTORYQUOTE_HISTORY_WILL_BE_KIND";
	victoryquotes[3] = "@VICTORYQUOTE_NOTHING_IN_LIFE_IS_SO";
	victoryquotes[4] = "@VICTORYQUOTE_SUCCESS_IS_NOT_FINAL";
	victoryquotes[5] = "@VICTORYQUOTE_WE_SHALL_DEFEND_OUR_ISLAND";
	victoryquotes[6] = "@VICTORYQUOTE_WHEN_YOU_GET_TO_THE_END";
	victoryquotes[7] = "@VICTORYQUOTE_THE_REAL_AND_LASTING";
	victoryquotes[8] = "@VICTORYQUOTE_A_HERO_IS_NO_BRAVER_THAN";
	victoryquotes[9] = "@VICTORYQUOTE_OUR_GREATEST_GLORY_IS";
	victoryquotes[10]= "@VICTORYQUOTE_THE_CHARACTERISTIC_OF";
	victoryquotes[11] = "@VICTORYQUOTE_IF_THE_OPPOSITION_DISARMS";
	victoryquotes[12] = "@VICTORYQUOTE_THE_OBJECT_OF_WAR_IS";
	victoryquotes[13] = "@VICTORYQUOTE_BETTER_TO_FIGHT_FOR_SOMETHING";
	victoryquotes[14] = "@VICTORYQUOTE_COURAGE_IS_FEAR_HOLDING";
	victoryquotes[15] = "@VICTORYQUOTE_IF_A_MAN_DOES_HIS_BEST";
	victoryquotes[16] = "@VICTORYQUOTE_IT_IS_FOOLISH_AND_WRONG";
	victoryquotes[17] = "@VICTORYQUOTE_EVERY_MANS_LIFE_ENDS";
	victoryquotes[18] = "@VICTORYQUOTE_ALL_WARS_ARE_CIVIL_WARS";
	victoryquotes[19] = "@VICTORYQUOTE_I_HAVE_NEVER_ADVOCATED";
	victoryquotes[20] = "@VICTORYQUOTE_WE_HAPPY_FEW_WE_BAND";
	victoryquotes[21] = "@VICTORYQUOTE_COWARDS_DIE_MANY_TIMES";
	victoryquotes[22] = "@VICTORYQUOTE_NEVER_INTERRUPT_YOUR";
	victoryquotes[23] = "@VICTORYQUOTE_THERE_ARE_ONLY_TWO_FORCES";
	victoryquotes[24] = "@VICTORYQUOTE_THERE_WILL_ONE_DAY_SPRING";
	victoryquotes[25] = "@VICTORYQUOTE_THERE_ARE_NO_ATHEISTS";
	victoryquotes[26] = "@VICTORYQUOTE_IF_WE_DONT_END_WAR_WAR";
	victoryquotes[27] = "@VICTORYQUOTE_LIVE_AS_BRAVE_MEN_AND";
	victoryquotes[28] = "@VICTORYQUOTE_COURAGE_AND_PERSEVERANCE";
	victoryquotes[29] = "@VICTORYQUOTE_COURAGE_IS_BEING_SCARED";
	victoryquotes[30] = "@VICTORYQUOTE_ABOVE_ALL_THINGS_NEVER";
	victoryquotes[31] = "@VICTORYQUOTE_I_HAVE_NEVER_MADE_BUT";
	victoryquotes[32] = "@VICTORYQUOTE_SAFEGUARDING_THE_RIGHTS";
	victoryquotes[33] = "@VICTORYQUOTE_HE_CONQUERS_WHO_ENDURES";
	victoryquotes[34] = "@VICTORYQUOTE_IT_IS_BETTER_TO_DIE_ON";
	victoryquotes[35] = "@VICTORYQUOTE_YOU_KNOW_THE_REAL_MEANING";
	victoryquotes[36] = "@VICTORYQUOTE_IN_WAR_THERE_IS_NO_SUBSTITUTE";
	victoryquotes[37] = "@VICTORYQUOTE_WAR_IS_A_SERIES_OF_CATASTROPHES";
                        
	i = randomInt(victoryquotes.size);

	setCvar("ui_victoryquote", victoryquotes[i]);
}

setDeadQuote()
{
	level endon ("mine death");
	level.player waittill("death");
	
	if(!level.missionfailed)
	{
		deadquotes[0] = "@DEADQUOTE_NEVER_IN_THE_FIELD_OF";
		deadquotes[1] = "@DEADQUOTE_SUCCESS_IS_NOT_FINAL";
		deadquotes[2] = "@DEADQUOTE_IN_WAR_THERE_IS_NO_PRIZE";
		deadquotes[3] = "@DEADQUOTE_OURS_IS_A_WORLD_OF_NUCLEAR";
		deadquotes[4] = "@DEADQUOTE_IT_IS_FATAL_TO_ENTER";
		deadquotes[5] = "@DEADQUOTE_IN_WAR_YOU_WIN_OR_LOSE";
		deadquotes[6] = "@DEADQUOTE_THE_SOLDIER_ABOVE_ALL";
		deadquotes[7] = "@DEADQUOTE_THEY_DIED_HARD_THOSE";
		deadquotes[8] = "@DEADQUOTE_SO_LONG_AS_THERE_ARE";
		deadquotes[9] = "@DEADQUOTE_WE_MUST_BE_PREPARED_TO";
		deadquotes[10]= "@DEADQUOTE_WAR_IS_AN_UGLY_THING";
		deadquotes[11] = "@DEADQUOTE_FUTURE_YEARS_WILL_NEVER";
		deadquotes[12] = "@DEADQUOTE_THERES_NO_HONORABLE_WAY";
		deadquotes[13] = "@DEADQUOTE_THE_DEATH_OF_ONE_MAN";
		deadquotes[14] = "@DEADQUOTE_DEATH_SOLVES_ALL_PROBLEMS";
		deadquotes[15] = "@DEADQUOTE_IN_THE_SOVIET_ARMY_IT";
		deadquotes[16] = "@DEADQUOTE_THE_OBJECT_OF_WAR_IS";
		deadquotes[17] = "@DEADQUOTE_IT_IS_FOOLISH_AND_WRONG";
		deadquotes[18] = "@DEADQUOTE_NEVER_THINK_THAT_WAR";
		deadquotes[19] = "@DEADQUOTE_EVERY_MANS_LIFE_ENDS";
		deadquotes[20] = "@DEADQUOTE_ALL_WARS_ARE_CIVIL_WARS";
		deadquotes[21] = "@DEADQUOTE_I_HAVE_NEVER_ADVOCATED";
		deadquotes[22] = "@DEADQUOTE_OLDER_MEN_DECLARE_WAR";
		deadquotes[23] = "@DEADQUOTE_ONLY_THE_DEAD_HAVE_SEEN";
		deadquotes[24] = "@DEADQUOTE_WAR_DOES_NOT_DETERMINE";
		deadquotes[25] = "@DEADQUOTE_DEATH_IS_NOTHING_BUT";
		deadquotes[26] = "@DEADQUOTE_PATRIOTS_ALWAYS_TALK";
		deadquotes[27] = "@DEADQUOTE_ALL_THAT_IS_NECESSARY";
		deadquotes[28] = "@DEADQUOTE_IT_IS_WELL_THAT_WAR_IS";
		deadquotes[29] = "@DEADQUOTE_A_SOLDIER_WILL_FIGHT";
		deadquotes[30] = "@DEADQUOTE_HE_WHO_FEARS_BEING_CONQUERED";
		deadquotes[31] = "@DEADQUOTE_YOU_MUST_NOT_FIGHT_TOO";
		deadquotes[32] = "@DEADQUOTE_THERES_A_GRAVEYARD_IN";
		deadquotes[33] = "@DEADQUOTE_IF_WE_DONT_END_WAR_WAR";
		deadquotes[34] = "@DEADQUOTE_FROM_MY_ROTTING_BODY";
		deadquotes[35] = "@DEADQUOTE_HE_WHO_HAS_A_THOUSAND";
		deadquotes[36] = "@DEADQUOTE_FOR_THE_ANGEL_OF_DEATH";
		deadquotes[37] = "@DEADQUOTE_THEY_WROTE_IN_THE_OLD";
		deadquotes[38] = "@DEADQUOTE_THERE_IS_MANY_A_BOY_HERE";
		deadquotes[39] = "@DEADQUOTE_WAR_IS_DELIGHTFUL_TO";
		deadquotes[40] = "@DEADQUOTE_WAR_IS_AS_MUCH_A_PUNISHMENT";
		deadquotes[41] = "@DEADQUOTE_WAR_WOULD_END_IF_THE";
		//deadquotes[29] = "@DEADQUOTE_THE_VICTOR_WILL_NEVER";
		//deadquotes[30] = "@DEADQUOTE_IN_STARTING_AND_WAGING";
		//deadquotes[31] = "@DEADQUOTE_SUCCESS_IS_THE_SOLE_EARTHLY";
		//deadquotes[32] = "@DEADQUOTE_WHAT_LUCK_FOR_RULERS";
	                       
		i = randomInt(deadquotes.size);
	
		setCvar("ui_deadquote", deadquotes[i]);
	}
}
