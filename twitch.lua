package.path = "../Content/Mods/TwitchIntegration/libs/share/?.lua;" .. package.path
package.cpath = "../Content/Mods/TwitchIntegration/libs/lib/?.dll;" .. package.cpath
local socket = require("socket")

local voting = 0
local isconnected = 0
local channeljoined = 0
local client = nil
local chosentable = {}
local votes = {}

for j=1, TwitchIntegration.Config.OfferedChoices do
	table.insert(votes, 0)
end

local voters = {}
local croomname = "error"

TwitchIntegration.NoVoteRooms = { "RoomPreRun", "DeathAreaBedroom", "DeathArea", "PostBoss" }
TwitchIntegration.Data.VotingWindow = { Components = {} }
TwitchIntegration.Data.NextVotingWindow = { Components = {} }

function TwitchIntegration.TwitchIntegration.IsInArray(array,value)
	for _,k in ipairs(array) do
		if k == value then
			return true
		end
	end
	return false
end

function TwitchIntegration.IsInGame()
	if CurrentRun ~= nil and CurrentRun.CurrentRoom ~= nil then

		-- If dead, leaving a room or on a screen transition
		if CurrentRun.Hero.IsDead or CurrentRun.InvulnerableFlags["LeaveRoom"] or CurrentRun.CurrentRoom.InStageTransition then
			return false
		end

		-- If in an invalid room
		for _,roomname in ipairs(NoVoteRooms) do
			if string.find(croomname, roomname) then
				return false
			end
		end

		return true
	end

	return false
end

function TwitchIntegration.OpenVotingWindow()

	ScreenAnchors.VotingWindow = DeepCopyTable(TwitchIntegration.Data.VotingWindow)
	local screen = ScreenAnchors.VotingWindow
	local components = screen.Components
	screen.Name = "VotingWindowName"

	SetConfigOption({ Name = "UseOcclusion", Value = false })
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

	-- Background

	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })

	local timerFontSize = 0
	local choiceFontSize = 0
	local backgroundX = 0
	local backgroundY = 0
	local backgroundScale = 0
	local backgroundScaleX = 0
	local backgroundScaleY = 0
	local numperrow = 0
	local timerX = 0
	local timerY = 0
	local rowStartX = 0
	local rowStartY = 0
	local rowoffset = 0
	local columnoffset = 0

	if TwitchIntegration.Config.UISize == 1 then
		timerFontSize = 20
		choiceFontSize = 15
		backgroundX = ScreenCenterX + 230
		backgroundY = ScreenCenterY + 480
		backgroundScale = 0.8
		backgroundScaleX = 1.0
		backgroundScaleY = 0.9
		numperrow = 3
		timerX = 90
		timerY = 445
		rowStartX = -110
		rowStartY = 480
		rowoffset = 30
		columnoffset = 240
	elseif TwitchIntegration.Config.UISize == 2 then
		timerFontSize = 25
		choiceFontSize = 20
		backgroundX = ScreenCenterX + 230
		backgroundY = ScreenCenterY + 480
		backgroundScale = 0.8
		backgroundScaleX = 1.4
		backgroundScaleY = 0.9
		numperrow = 3
		timerX = 90
		timerY = 445
		rowStartX = -250
		rowStartY = 480
		rowoffset = 30
		columnoffset = 350
	elseif TwitchIntegration.Config.UISize == 3 then
		timerFontSize = 30
		choiceFontSize = 25
		backgroundX = ScreenCenterX + 245
		backgroundY = ScreenCenterY + 475
		backgroundScale = 0.8
		backgroundScaleX = 1.63
		backgroundScaleY = 1.0
		numperrow = 3
		timerX = 85
		timerY = 435
		rowStartX = -330
		rowStartY = 470
		rowoffset = 40
		columnoffset = 405
	end

	components.VoteTimer = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
	components.VoteBackground = CreateScreenComponent({ Name = "TraitTrayDetailsBacking", Group = "Combat_Menu", Scale = backgroundScale, X = backgroundX, Y = backgroundY })
	SetScaleX({Id = components.VoteBackground.Id, Fraction = backgroundScaleX })
	SetScaleY({Id = components.VoteBackground.Id, Fraction = backgroundScaleY })

	-- Text

	CreateTextBox({ Id = components.VoteTimer.Id, Text = "TwitchIntegration_CurrentVoteTimer", FontSize = timerFontSize,
	LuaKey = "TempTextData", LuaValue = { Time = 999 },
	OffsetX = timerX, OffsetY = timerY, Width = 400, Color = TwitchIntegration.Config.VoteTimerTextColor, Font = "AlegreyaSansSCExtraBold",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left"})

	for j=1, TwitchIntegration.Config.OfferedChoices do
		local key = "Vote"..j
		local offsetX = rowStartX + columnoffset*((j-1) % numperrow)
		local offsetY = rowStartY + rowoffset*(math.floor((j-1)/numperrow))
		components[key] = CreateScreenComponent({ Name = "BlankObstacle", Group = "Combat_Menu" })
		CreateTextBox({ Id = components[key].Id, Text = "TwitchIntegration_Choice", FontSize = choiceFontSize,
		LuaKey = "TempTextData", LuaValue = { ChoiceNum = j, ChoiceName = chosentable[j].Name, VoteCount = 0},
		OffsetX = offsetX, OffsetY = offsetY, Width = 400, Color = TwitchIntegration.Config.ChoiceTextColor, Font = "AlegreyaSansSCExtraBold",
		ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left" })
	end
end

function TwitchIntegration.OpenNextVoteWindow()
	ScreenAnchors.NextVotingWindow = DeepCopyTable(TwitchIntegration.Data.NextVotingWindow)
	local screen = ScreenAnchors.NextVotingWindow
	local components = screen.Components
	screen.Name = "NextVotingWindowName"

	SetConfigOption({ Name = "UseOcclusion", Value = false })
	PlaySound({ Name = "/SFX/Menu Sounds/GodBoonInteract" })

	components.Background = CreateScreenComponent({ Name = "BlankObstacle", Group = "NextVotingWindowGroup" })
	components.VoteTimer = CreateScreenComponent({ Name = "BlankObstacle", Group = "NextVotingWindowGroup" })

	CreateTextBox({ Id = components.VoteTimer.Id, Text = "TwitchIntegration_NextVoteTimer", FontSize = 30,
	LuaKey = "TempTextData", LuaValue = { Time = 999 },
	OffsetX = 260, OffsetY = -510, Width = 400, Color = TwitchIntegration.Config.NextVoteTimerTextColor, Font = "AlegreyaSansSCExtraBold",
	ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 1}, Justification = "Left"})
end

function TwitchIntegration.CloseVotingWindow()
	if ScreenAnchors.VotingWindow ~= nil then
		CloseScreen(GetAllIds(ScreenAnchors.VotingWindow.Components), 0.1)
		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
		ScreenAnchors.VotingWindow = nil
	end
end

function TwitchIntegration.CloseNextVoteWindow()
	if ScreenAnchors.NextVotingWindow ~= nil then
		CloseScreen(GetAllIds(ScreenAnchors.NextVotingWindow.Components), 0.1)
		PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENU" })
		ScreenAnchors.NextVotingWindow = nil
	end
end

function TwitchIntegration.TimeBetweenVote()
	local betweentime = TwitchIntegration.Config.TimeBetweenVotes
	for i=betweentime,1,-1 do
		if TwitchIntegration.IsInGame() then

			if ScreenAnchors.NextVotingWindow == nil then
				TwitchIntegration.OpenNextVoteWindow()
			end

			ModifyTextBox({ Id = ScreenAnchors.NextVotingWindow.Components.VoteTimer.Id, Text = "TwitchIntegration_NextVoteTimer",
			LuaKey = "TempTextData", LuaValue = { Time = i},})
			wait(1)
		else
			while not TwitchIntegration.IsInGame() do
				i = i+1
				wait(1)
			end
		end
	end
	voting = 1

	-- Calculate which 4 options will be used and such here
	-- make a table with these options

	chosentable = {} -- this will contain the votes that we want to display and then run for this loop
	local loopCount = 0

	while TableLength( chosentable ) < TwitchIntegration.Config.OfferedChoices and loopCount < 20 do
		local weightedList = {}
		for i, event in pairs( TwitchIntegration.Events ) do
			if event.Enabled
			and not Contains(chosentable, event)
			and not TwitchIntegration.HasReachedTargetCount(chosentable, event.EventAlignment, "Alignment")
			and not TwitchIntegration.HasReachedTargetCount(chosentable, event.EventType, "Type")
			and not TwitchIntegration.Cooldowns[event.Name]
			then
				weightedList[i] = event.Weight
			end

			if loopCount >= 10
			and event.Enabled
			and not Contains(chosentable, event)
			and not TwitchIntegration.Cooldowns[event.Name]
			then
				DebugPrint({Text="Failsafe triggered!"})
				weightedList[i] = event.Weight
			end
		end

		local index = GetRandomValueFromWeightedList( weightedList )
		table.insert( chosentable, TwitchIntegration.Events[index] )
		loopCount = loopCount + 1
	end

	TwitchIntegration.CloseNextVoteWindow()
	thread(TwitchIntegration.CountdownVote)
end

function TwitchIntegration.ReduceCooldowns()
	for event in pairs (TwitchIntegration.Cooldowns) do
		TwitchIntegration.Cooldowns[event] = TwitchIntegration.Cooldowns[event] - 1
		if TwitchIntegration.Cooldowns[event] <= 0 then
			TwitchIntegration.Cooldowns[event] = nil
		end
	end
end

function TwitchIntegration.HasReachedTargetCount(events, target, type)

	local goodCount = 0
	local badCount = 0
	local neutralCount = 0
	local spawnCount = 0
	local effectCount = 0
	local lootCount = 0
	local resourceCount = 0

	if type == "Alignment" then
		for i, event in pairs (events) do
			if event.EventAlignment == "Good" then
				goodCount = goodCount + 1
			elseif event.EventAlignment == "Bad" then
				badCount = badCount + 1
			elseif event.EventAlignment == "Neutral" then
				neutralCount = neutralCount + 1
			end
		end
	elseif type == "Type" then
		for i, event in pairs (events) do
			if event.EventType == "Spawn" then
				spawnCount = spawnCount + 1
			elseif event.EventType == "Effect" then
				effectCount = effectCount + 1
			elseif event.EventType == "Loot" then
				lootCount = lootCount + 1
			elseif event.EventType == "Resource" then
				resourceCount = resourceCount + 1
			end
		end
	end

	if goodCount >= TwitchIntegration.Config.GoodChoiceCount and target == "Good" then
		return true
	elseif badCount >= TwitchIntegration.Config.BadChoiceCount and target == "Bad" then
		return true
	elseif neutralCount >= TwitchIntegration.Config.NeutralChoiceCount and target == "Neutral" then
		return true
	elseif spawnCount >= TwitchIntegration.Config.SpawnChoiceCount and target == "Spawn" then
		return true
	elseif effectCount >= TwitchIntegration.Config.EffectChoiceCount and target == "Effect" then
		return true
	elseif lootCount >= TwitchIntegration.Config.LootChoiceCount and target == "Loot" then
		return true
	elseif resourceCount >= TwitchIntegration.Config.ResourceChoiceCount and target == "Resource" then
		return true
	end

	return false
end

function TwitchIntegration.CountdownVote()

	TwitchIntegration.OpenVotingWindow()
	local votingtime = TwitchIntegration.Config.VotingTime
	for i=votingtime,1,-1 do
		if TwitchIntegration.IsInGame() then

			if ScreenAnchors.VotingWindow == nil then
				TwitchIntegration.OpenVotingWindow()
			end
			ModifyTextBox({ Id = ScreenAnchors.VotingWindow.Components.VoteTimer.Id,
			LuaKey = "TempTextData", LuaValue = { Time = i},})

			for j=1, TwitchIntegration.Config.OfferedChoices do
				ModifyTextBox({ Id = ScreenAnchors.VotingWindow.Components["Vote" .. j].Id,
				LuaKey = "TempTextData", LuaValue = { ChoiceNum = j, ChoiceName = chosentable[j].Name, VoteCount = votes[j]},})
			end
			wait(1)
		else
			while not TwitchIntegration.IsInGame() do
				i = i+1
				wait(1)
			end
		end
	end
	voting = 0

	---Here is where we find which event had the most votes
	local winner = 0
	for i=1, TwitchIntegration.Config.OfferedChoices do
		if votes[i] > winner then
			winner = votes[i]
		end
	end

	local theevents = {}

	--Add all events which match the highest vote (which should be all 4 if no votes were cast)
	for i=1, TwitchIntegration.Config.OfferedChoices do
		if votes[i] == winner then
			table.insert(theevents,chosentable[i])
		end
	end

	--Count how many events, generate a random number and select that event
	local finalcount = 0
	for i,data in ipairs(theevents) do
		finalcount = finalcount + 1
	end

	local selectedEventIndex = math.random(finalcount)
	--This is our randomly selected event
	local rngevent = theevents[selectedEventIndex]

	votes = {}
	for j=1, TwitchIntegration.Config.OfferedChoices do
		table.insert(votes, 0)
	end
	voters = {}

	while not TwitchIntegration.IsInGame() do
		wait(1)
	end

	TwitchIntegration.ReduceCooldowns()

	TwitchIntegration.Cooldowns[rngevent.Name] = rngevent.ForcedCooldown or 1
	local action = rngevent.Action.Name
	thread(TwitchIntegration.Actions[action] or _G[action], rngevent.Action.Args)
	ValidateCheckpoint({ Valid = true })

	TwitchIntegration.CloseVotingWindow()
	thread(TwitchIntegration.TimeBetweenVote)
end

function TwitchIntegration.TwitchConnect() -- Here we start the twitch integration on a thread
	client = socket.tcp()
	host = "irc.chat.twitch.tv"
	nick = "justinfan1893"

	--Connect. Please connect.
	isconnected = client:connect(host, 6667)
	client:settimeout(0, t)

	--If we fail a connection
	if isconnected ~= 1 then
		client:close()
		isconnected = 0
	end

	client:send("NICK " .. nick .. "\r\n")

	local resp, err = nil
	while err == nil do --This is the main loop for recieving data
		resp, err = client:receive()
		if resp ~= nil then
			if string.find(resp,"PRIVMSG") and voting == 1 then -- If we are accepting votes and a twitch message comes in
				local a,b = string.find(resp,"PRIVMSG #" .. TwitchIntegration.Config.Username .. " :",1,true)
				local incmessage = string.sub(resp,b+1)

				local startindex = string.find(resp,':')
				local endindex = string.find(resp,'!')
				local sender = string.sub(resp,startindex + 1, endindex-1)

				--If sender has not already made a vote
				if not TwitchIntegration.IsInArray(voters,sender) then
					for i=1,TwitchIntegration.Config.OfferedChoices do
						if incmessage:find("^" .. i) ~= nil then -- If a 1 (or x emote in future) was found at BEGINNING
							votes[i] = votes[i] + 1
							table.insert(voters,sender)
							break
						end
					end
				end

				--This needs more filtering, we have the message but now we need to extract the first number that is 1-4
			elseif string.find(resp,"tmi.twitch.tv 376") then -- We got the Hello Message... Join a channel
				client:send("JOIN #" .. TwitchIntegration.Config.Username .."\r\n")
			elseif string.find(resp, "tmi.twitch.tv JOIN") then -- We finished joining a channel.
				channeljoined = 1
				thread(TwitchIntegration.TimeBetweenVote)
			elseif string.find(resp,"PING :tmi.twitch.tv") then -- We reveived a PING, reply back with PONG!
				client:send("PONG :tmi.twitch.tv\r\n")
			end
		end

		if err == 'timeout' then -- We expect timeouts because receive will timeout while waiting for incomming messages. This allows it to be non blocking.
			err = nil
		end
		wait(1)
	end
	client:close()
	isconnected = 0
	channeljoined = 0
end

function TwitchIntegration.LoadTrigger(triggerArgs)
	if triggerArgs ~= nil and triggerArgs.name ~= nil then
		croomname = triggerArgs.name
	else
		croomname = "error"
	end

	if isconnected == 0 and CurrentRun ~= nil then
		if CurrentRun.CurrentRoom ~= nil then
			thread(TwitchIntegration.TwitchConnect)
		end
	end
end

OnAnyLoad{TwitchIntegration.LoadTrigger}
