--[[	Config for Twitch Integration	]]--
--	Written By: Kriogenic
--	Adapted to StyxScribe by: erumi321

-- USAGE INSTRUCTIONS
--		Enter your username in all lowercase in the Username field making sure to keep the " around it
--		Enter your OAuth token in the OAuth field, making sure that it has "oauth:" before the rest of the code
--		Change SendConfirmMessage to true or false, if true when a viewer makes a vote your account will send an automated message saying, "Thanks for the vote {user}"
--		Enter the cooldown time between votes in seconds in the TwitchIntegration.Config.TimeBetweenVotes field
--		Enter the time in seconds your viewers have to make their votes in the VotingTime field
--		DO NOT TOUCH ANYTHING ELSE xD

--		YOU MUST USE subsume_hades.py IN THE Hades FOLDER TO RUN THIS MOD! IT WILL NOT WORK OTHERWISE.
--		You will probably want to make a shortcut to the script as thats the easiest way to run it

TwitchIntegration.Config = {
	Username = "", --your channel name (do not put # before it, that is handeled by the mod. If you have no idea why you would do this, continue not doing this)
	OAuth = "", --Example: "oauth:123abc456def789ghi0123jkl456mno"
	SendConfirmMessage = true,
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