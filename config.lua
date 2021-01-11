--[[	Config for Twitch Integration	]]--
--	Written By: Kriogenic

-- USAGE INSTRUCTIONS
--		Enter your username in all lowercase in the Username field making sure to keep the " around it
--		Enter the cooldown time between votes in seconds in the TimeBetweenVotes field
--		Enter the time in seconds your viewers have to make their votes in the VotingTime field
--		DO NOT TOUCH ANYTHING ELSE xD
TwitchIntegrationConfig = {
	Username = "0lrevolution",
	TimeBetweenVotes = 1,
	VotingTime = 10,
	OfferedChoices = 6,

	GoodChoiceCount = 3, -- total of good + bad + neutral should be a minimum of 1 and maximum of 6 atm
	BadChoiceCount = 3,
	NeutralChoiceCount = 0, -- no neutral event atm

	SpawnChoiceCount = 2, -- all those should add up to OfferedChoices + 1, and each should be at least 1
	EffectChoiceCount = 2,
	ResourceChoiceCount = 2,
	LootChoiceCount = 2,

	UISize = 3, -- 1 = small, 2 = medium, 3 = large
	NextVoteTimerTextColor = Color.Yellow,
	VoteTimerTextColor = Color.White,
	ChoiceTextColor = Color.Yellow,
}
SaveIgnores["TwitchIntegrationConfig"] = true