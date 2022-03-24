--Mapped to id "HEALTH_PLUS"
function TwitchIntegration.Actions.HealPlayer(args)
        Heal( CurrentRun.Hero, { HealAmount = CurrentRun.Hero.MaxHealth / args.Percentage, SourceName = "Item" } )
        thread( UpdateHealthUI )
end

--Mapped to id "HEALTH_MINUS"
function TwitchIntegration.Actions.DamagePlayer(args)
    Damage( CurrentRun.Hero, { triggeredById = CurrentRun.Hero.ObjectId, DamageAmount = CurrentRun.Hero.MaxHealth / args.Percentage, MinHealth = 1, PureDamage = true, Silent = false } )
end

--Mapped to id "MAX_HEALTH_PLUS"
function TwitchIntegration.Actions.SpawnConsumable(args)
    local consumableId = SpawnObstacle({ Name = args.LootName, DestinationId =  CurrentRun.Hero.ObjectId, Group = "Standing" })
    local cost = 0
    local consumable = CreateConsumableItem( consumableId, args.LootName, cost )
    ActivatedObjects[consumable.ObjectId] = consumable
    ApplyUpwardForce({ Id = consumableId, Speed = 450 })
    -- PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })
    -- consumable.IgnorePurchase = true
end

--Mapped to id "SPAWN_HAMMER"
function TwitchIntegration.Actions.SpawnLoot(args)
    while CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and not IsCombatEncounterActive( CurrentRun ) do
        wait(1)
    end
	CreateLoot({ Name = args.LootName, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
end

--Mapped to id "SPAWN_POWERPOM"
function TwitchSpawnPom(event)
    while CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and not IsCombatEncounterActive( CurrentRun ) do
        wait(1)
    end
    CreateLoot({ Name = "StackUpgrade", OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
end

--Mapepd to id "REMOVE_BOON"
-- TODO : REMAKE
function TwitchIntegration.Actions.RemoveRandomBoon(args)
    local traitnum = 0
    for i, traitData in pairs( CurrentRun.Hero.Traits ) do
        traitnum = traitnum + 1
    end

    if traitnum > 0 then
        local index = math.random(traitnum)
        table.remove(CurrentRun.Hero.Traits,index)
        HideCombatUI()
        ShowCombatUI()
    end
end

--Mapped to id "SPAWN_RANDOM_BOON"
-- TODO : REMAKE
function TwitchIntegration.Actions.SpawnRandomLoot(args)
    local godname = TwitchIntegration.Data.GodNames[math.random(10)]
    while CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and not IsCombatEncounterActive( CurrentRun ) do
        wait(1)
    end
    CreateLoot({ Name = godname, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
end

--Mapped to id "SPAWN_ENEMIES"
-- TODO : REMAKE
function TwitchIntegration.Actions.SpawnRandomEnemies(args)
    local EnemyTable = {}
    for i = 1, args.EnemyCount do
      table.insert(EnemyTable,TwitchIntegration.Data.EnemyNames[math.random(44)])
    end

    for _,v in ipairs(EnemyTable) do
      local enemyData = EnemyData[v]
      local newEnemy = DeepCopyTable( enemyData )
      newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
      SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
      UseableOff({ Id = newEnemy.ObjectId })
    end
end

--Mapped to id "GIVE_PLAYER_GOLD"
function TwitchIntegration.Actions.GiveMoney(args)
    local sound = "/SFX/GoldCoinPickup"
    PlaySound({ Name = sound, ManagerCap = 28 })
    CurrentRun.Money = CurrentRun.Money + args.Amount
    ShowResourceUIs({ CombatOnly = not CurrentRun.Hero.IsDead, UpdateIfShowing = true })
    UpdateMoneyUI( CurrentRun.Money )
end

--Mapped to id "REMOVE_PLAYER_GOLD"
function TwitchIntegration.Actions.RemoveMoney(args)
    local sound = "/SFX/GoldCoinPickup"
    PlaySound({ Name = sound, ManagerCap = 28 })
    CurrentRun.Money = math.max(CurrentRun.Money - args.Amount, 0)
    ShowResourceUIs({ CombatOnly = not CurrentRun.Hero.IsDead, UpdateIfShowing = true })
    UpdateMoneyUI( CurrentRun.Money )
end

--Mapped to id "DRAIN_GOD_GAUGE"
function TwitchIntegration.Actions.EmptySuperMeter(args)
    BuildSuperMeter(CurrentRun,CurrentRun.Hero.SuperMeter * -1)
end

--Mapped to id "FILL_GOD_GAUGE"
function TwitchIntegration.Actions.FillSuperMeter(args)
    BuildSuperMeter(CurrentRun,CurrentRun.Hero.SuperMeterLimit)
end

-- Mapped to id "DISALLOW_DASH"
-- TODO: REMAKE
function TwitchIntegration.Actions.DisableDash(args)
    RecordSpeedModifier( 0.5, 60 )
end

-- Mapped to id "KILL_ALL_ENEMIES"
-- TODO: Don't kill bosses + arg for traps
function TwitchIntegration.Actions.RoomWipe(args)
    for enemyId, enemy in pairs(ActiveEnemies) do
		if enemy and not enemy.IsDead then
		    Kill(enemy)
		end
	end
end

-- TODO: MAKE
function TwitchIntegration.Actions.ApplyEffectToEnemies(args)
end

-- TODO: MAKE
function TwitchIntegration.Actions.SpawnEnemies(args)
end

-- TODO: MAKE
function TwitchIntegration.Actions.SpawnBoon(args)
end

--Mapped to id "SPAWN_MINI_CHARIOTS"
function TwitchSpawnMiniChariots(event)
    local EnemyTable = {}
    local amount = math.random(8)
    for i = 1, amount do
      table.insert(EnemyTable,TwitchIntegration.Data.EnemyNames[9])
    end

    for _,v in ipairs(EnemyTable) do
      local enemyData = EnemyData[v]
      local newEnemy = DeepCopyTable( enemyData )
      newEnemy.ObjectId = SpawnUnit({ Name = "ChariotSuicide", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
      SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
      UseableOff({ Id = newEnemy.ObjectId })
    end
end

--Mapped to id "SPAWN_PESTS"
function TwichSpawnPests(event)
    local EnemyTable = {}
    local amount = math.random(8)
    for i = 1, amount do
      table.insert(EnemyTable,TwitchIntegration.Data.EnemyNames[45])
    end

    for _,v in ipairs(EnemyTable) do
      local enemyData = EnemyData[v]
      local newEnemy = DeepCopyTable( enemyData )
      newEnemy.ObjectId = SpawnUnit({ Name = "ThiefMineLayer", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
      SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
      UseableOff({ Id = newEnemy.ObjectId })
    end
end

--[[
--Mapped to id "SPAWN_CHAOS_BOON"
function TwitchSpawnChaosInteractible(event)
local godname = TwitchIntegration.Data.GodNames[10]
	while CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and not IsCombatEncounterActive( CurrentRun ) do
		wait(1)
	end
	CreateLoot({ Name = godname, OffsetX = 100, SpawnPoint = CurrentRun.Hero.ObjectId })
end
]]--

--Mapped to id "HIDE_UI"
-- TODO: REMAKE
function TwitchIntegration.Actions.HideUI(args)
    if ConfigOptionCache.ShowUIAnimations then
        SetConfigOption({ Name = "ShowUIAnimations", Value = false })
        SetConfigOption({ Name = "UseOcclusion", Value = false })
        HideCombatUI()
        wait(30)
        SetConfigOption({ Name = "ShowUIAnimations", Value = true })
        SetConfigOption({ Name = "UseOcclusion", Value = true })
        ShowCombatUI()
      else
        SetConfigOption({ Name = "ShowUIAnimations", Value = true })
        SetConfigOption({ Name = "UseOcclusion", Value = true })
        ShowCombatUI()
        wait(3)
        SetConfigOption({ Name = "ShowUIAnimations", Value = false })
        SetConfigOption({ Name = "UseOcclusion", Value = false })
        HideCombatUI()
        wait(30)
        SetConfigOption({ Name = "ShowUIAnimations", Value = true })
        SetConfigOption({ Name = "UseOcclusion", Value = true })
        ShowCombatUI()
      end
      UpdateConfigOptionCache()
end

-- TODO: MAKE
function TwitchIntegration.Actions.AddTrait(args)
end

--Mapped to id "TEMP_BOON_RARITY"
function TwitchForceBoonUp(event)
    AddTraitToHero({ TraitName = TwitchIntegration.Data.TempItems[1] })
end

--Mapped to id "TEMP_BOON_CHAOS"
function TwitchForceNextGate(event)
    AddTraitToHero({ TraitName = TwitchIntegration.Data.TempItems[3] })
end

--Mapped to id "TEMP_BOON_TROVE"
function TwitchForceTrove(event)
    AddTraitToHero({ TraitName = TwitchIntegration.Data.TempItems[4] })
end

--Mapped to id "TEMP_BOON_FISHING"
function TwitchForceFishPoint(event)
    AddTraitToHero({ TraitName = TwitchIntegration.Data.TempItems[5] })
end

--Mapped to id "TEMP_BOON_LASTSTAND"
-- TODO: REMAKE
function TwitchIntegration.Actions.AddDefiance(args)
    local consumableName = TwitchIntegration.Data.TempItems[6]
    local playerId = GetIdsByType({ Name = "_PlayerUnit" })
    local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = playerId, Group = "Standing" })
    local consumable = CreateConsumableItem( consumableId, consumableName, 0 )
    consumable.IgnorePurchase = true
    if consumable.AddMaxHealthArgs then
      consumable.AddMaxHealthArgs.Silent = true
    end
end

--Mapped to id "SPAWN_MINELAYER_BOSS"
-- TODO: REMAKE
function TwitchIntegration.Actions.SpawnMineBoss(args)
    local EnemyTable = { "ThiefImpulseMineLayerMiniboss", "ThiefMineLayerElite", "ThiefMineLayerElite", "ThiefMineLayer", "ThiefMineLayer", "ThiefMineLayer" }      
    for _,v in ipairs(EnemyTable) do
      local enemyData = EnemyData[v]
      local newEnemy = DeepCopyTable( enemyData )
      newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
      SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
      UseableOff({ Id = newEnemy.ObjectId })
    end
end

--Mapped to id "SPAWN_RATTHUG_BOSS"
-- TODO: REMAKE
function TwitchIntegration.Actions.SpawnRatBoss(args)
      local EnemyTable = { "RatThugMiniboss", "RatThugElite", "RatThugElite", "RatThug", "RatThug", "RatThug" }
      for _,v in ipairs(EnemyTable) do
        local enemyData = EnemyData[v]
        local newEnemy = DeepCopyTable( enemyData )
        newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
        SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
        UseableOff({ Id = newEnemy.ObjectId })
      end
end

--Mapped to id "SPAWN_HELPING_HANDS"
-- TODO: REMAKE
function TwitchIntegration.Actions.SpawnHandsBoss(args)
    local EnemyTable = { "DisembodiedHand", "DisembodiedHand", "DisembodiedHand", "DisembodiedHand", "DisembodiedHand", "DisembodiedHand" }
    for _,v in ipairs(EnemyTable) do
      local enemyData = EnemyData[v]
      local newEnemy = DeepCopyTable( enemyData )
      newEnemy.ObjectId = SpawnUnit({ Name = enemyData.Name, Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, OffsetX = math.random(-500,500), OffsetY = math.random(-500,500) })
      SetupEnemyObject( newEnemy, CurrentRun, { SkipSpawnVoiceLines = true } )
      UseableOff({ Id = newEnemy.ObjectId })
    end
end

function TwitchIntegration.Actions.CreateDevotionEffect(args)
    local GodName = GetRandomValue({
            "Zeus",
            "Poseidon",
            "Athena",
            "Aphrodite",
            "Artemis",
            "Ares",
            "Dionysus",
            "Demeter",
        })
    local newEnemy = DeepCopyTable( EnemyData[GodName.."UpgradeRoomWeapon"] )
    newEnemy.ObjectId = SpawnUnit({ Name = GodName.."UpgradeRoomWeapon", Group = "Standing", DestinationId = CurrentRun.Hero.ObjectId, DoActivatePresentation = false })
    SetupEnemyObject( newEnemy, CurrentRun )
    wait(args.Duration)
    Destroy({Id = newEnemy.ObjectId})
end