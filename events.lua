TwitchIntegration.Data =
{
--Did not reinvent this wheel, copied from CodexMenu
	ZeusUpgrade =
	{
	  "ZeusWeaponTrait", "ZeusRushTrait", "ZeusRangedTrait", "ZeusSecondaryTrait", "ZeusShoutTrait",
		"RetaliateWeaponTrait", "SuperGenerationTrait", "OnWrathDamageBuffTrait", "ZeusBonusBounceTrait",
		"ZeusLightningDebuff", "ZeusBoltAoETrait", "ZeusBonusBoltTrait", "ZeusChargedBoltTrait",
		"PerfectDashBoltTrait",
	},
	PoseidonUpgrade =
	{
		"PoseidonWeaponTrait", "PoseidonSecondaryTrait", "PoseidonRushTrait", "PoseidonRangedTrait", "PoseidonShoutTrait",
		"RoomRewardBonusTrait", "DefensiveSuperGenerationTrait", "BonusCollisionTrait", "SlamExplosionTrait", "SlipperyTrait", "BossDamageTrait",
		"RandomMinorLootDrop", "DoubleCollisionTrait",
		"PoseidonShoutDurationTrait", "EncounterStartOffenseBuffTrait", "FishingTrait"
	},
	AthenaUpgrade =
	{
		"AthenaWeaponTrait", "AthenaSecondaryTrait", "AthenaRushTrait", "AthenaRangedTrait", "AthenaShoutTrait",
		"TrapDamageTrait", "EnemyDamageTrait", "AthenaRetaliateTrait", "PreloadSuperGenerationTrait",
		"AthenaBackstabDebuffTrait", "AthenaShieldTrait", "LastStandDurationDrop", "LastStandHealDrop", "ShieldHitTrait",
		"LastStandDurationTrait", "LastStandHealTrait"
	},
	AphroditeUpgrade =
	{
		"AphroditeWeaponTrait", "AphroditeRushTrait", "AphroditeRangedTrait", "AphroditeSecondaryTrait", "AphroditeShoutTrait",
		"AphroditeRetaliateTrait", "AphroditeDeathTrait", "ProximityArmorTrait", "HealthRewardBonusTrait",
		"AphroditeDurationTrait", "AphroditeWeakenTrait", "AphroditePotencyTrait", "CharmTrait",
		"AphroditeRangedBonusTrait",
	},
	ArtemisUpgrade =
	{
		"ArtemisWeaponTrait", "ArtemisRushTrait", "ArtemisRangedTrait", "ArtemisSecondaryTrait", "ArtemisShoutTrait",
		"CritBonusTrait", "ArtemisSupportingFireTrait", "CritVulnerabilityTrait", "ArtemisCriticalTrait",
		"CriticalBufferMultiplierTrait", "CriticalSuperGenerationTrait", "ArtemisAmmoExitTrait", "MoreAmmoTrait",
	},
	AresUpgrade =
	{
		"AresWeaponTrait", "AresRushTrait", "AresRangedTrait", "AresSecondaryTrait" , "AresShoutTrait",
		"AresRetaliateTrait", "IncreasedDamageTrait", "OnEnemyDeathDamageInstanceBuffTrait", "AresLongCurseTrait",
		"AresLoadCurseTrait", "AresDragTrait", "AresAoETrait", "AresCursedRiftTrait",
		"LastStandDamageBonusTrait",
	},
	DionysusUpgrade =
	{
		"DionysusWeaponTrait", "DionysusSecondaryTrait", "DionysusRushTrait", "DionysusRangedTrait", "DionysusShoutTrait",
		"DoorHealTrait", "LowHealthDefenseTrait", "DionysusSpreadTrait", "DionysusSlowTrait", "DionysusPoisonPowerTrait",
		"DionysusDefenseTrait", "DionysusGiftDrop", "DionysusComboVulnerability",
		"FountainDamageBonusTrait",
		"GiftHealthTrait",
	},
	HermesUpgrade =
	{
		"AmmoReloadTrait", "HermesShoutDodge", "HermesWeaponTrait", "HermesSecondaryTrait", "RushRallyTrait", "MoveSpeedTrait",
		"RushSpeedBoostTrait", "RapidCastTrait", "BonusDashTrait", "DodgeChanceTrait", "AmmoReclaimTrait", "MagnetismTrait", "UnstoredAmmoDamageTrait",
		"RegeneratingSuperTrait", "ChamberGoldTrait", "SpeedDamageTrait",
	},
	DemeterUpgrade =
	{
		--Removed "HarvestBoonDrop", causes crash
		"DemeterWeaponTrait", "DemeterSecondaryTrait", "DemeterRushTrait", "DemeterRangedTrait", "DemeterShoutTrait",
		"CastNovaTrait", "ZeroAmmoBonusTrait", "MaximumChillBlast", "MaximumChillBonusSlow", "HealingPotencyDrop", "InstantChillKill",
		"DemeterRangedBonusTrait", "DemeterRetaliateTrait",
		"HealingPotencyTrait",
	},
	TrialUpgrade =
	{
		"ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait",
		"ChaosBlessingBoonRarityTrait", "ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait",
		"ChaosBlessingDashAttackTrait", "ChaosBlessingExtraChanceTrait", "ChaosBlessingBackstabTrait", "ChaosBlessingAlphaStrikeTrait",
	},
	GodNames =
	{
		"ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "ArtemisUpgrade", "AresUpgrade", "DionysusUpgrade", "HermesUpgrade", "DemeterUpgrade", "TrialUpgrade",
	},
  -- 45 enemy entries, minichariot is 9, ThiefImpulseMineLayerMiniboss is 5, ThiefMineLayer is 45
  EnemyNames =
  {
    "IllusionistClone", "ShieldRangedElite", "BlastCubeFusedRegenerating", "PunchingBagUnitSuperElite", "LightSpawner", "SwarmerSuperElite",
    "CrusherUnit", "ChariotSuicide", "IllusionistClone", "ShieldRangedElite", "BlastCubeFusedRegenerating", "PunchingBagUnitSuperElite", "ReflectiveMirror", "LightSpawner",
    "SwarmerSuperElite", "CrusherUnit", "ChariotSuicide", "ShadeSpawnerElite", "UnstableGenerator", "HeavyMeleeSuperElite", "HeavyRangedElite",
    "ShadeBowUnitSuperElite", "TimeCrystal", "Illusionist", "GunBombUnit", "HeavyRanged", "FlurrySpawner", "RangedBurrowerElite", "SplitShotUnitElite", "Harpy",
    "HeavyRangedSplitterMinibossSuperElite", "ChariotSuperElite", "SupportShields", "BloodlessNakedBerserkerElite", "ShadeNaked", "ShadeSwordUnit", "BloodlessSelfDestructElite", "CrusherUnitSuperElite", "LightRanged", "HeavyMelee", "HealRanged", "ThiefMineLayer"
  },
  -- Temporary items from the well shops
  TempItems =
  {
    "TemporaryBoonRarityTrait", "TemporaryPreloadSuperGenerationTrait", "TemporaryForcedSecretDoorTrait", "TemporaryForcedChallengeSwitchTrait", "TemporaryForcedFishingPointTrait", "LastStandDrop"
  }
}

TwitchIntegration.Events =
{
	-- Template
	-- {
	-- 	Name = "TwitchIntegration_EVENT_NAME",
	-- 	Weight = 1.0,
	-- 	EventType = "Spawn", -- "Spawn", "Loot", "Effect", "Resource"
	-- 	EventAlignment = "Bad", -- "Good", "Bad", "Neutral"...
	-- 	ForcedCooldown = 5, -- either nil or a number value
	-- 	Enabled = true, -- either true or false
	-- 	Action =
	-- 	{
	-- 		Name = "EventFunction",
	-- 		Args = {},
	-- 	},
	-- },
	-- Heal player
	{
		Name = "TwitchIntegration_PLAYER_HEAL",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "HealPlayer",
			Args = { Percentage = 10, },
		},
	},
	-- Damage player
	{
		Name = "TwitchIntegration_PLAYER_DAMAGE",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "DamagePlayer",
			Args = { Percentage = 10, },
		},
	},
	-- Spawn Centaur Heart
	{
		Name = "TwitchIntegration_SPAWN_CENTAUR",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "RoomRewardMaxHealthDrop"},
		},
	},
	-- Spawn Hammer
	{
		Name = "TwitchIntegration_SPAWN_HAMMER",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnLoot",
			Args = { LootName = "WeaponUpgrade"},
		},
	},
	-- Spawn Pom
	{
		Name = "TwitchIntegration_SPAWN_POM",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnLoot",
			Args = { LootName = "StackUpgrade"},
		},
	},
	-- Remove random boon
	{
		Name = "TwitchIntegration_REMOVE_RANDOM_BOON",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "RemoveRandomBoon",
			Args = {},
		},
	},
	-- Spawn random boon
	{
		Name = "TwitchIntegration_SPAWN_RANDOM_BOON",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnRandomLoot",
			Args = {},
		},
	},
	-- Spawn random enemies
	{
		Name = "TwitchIntegration_SPAWN_RANDOM_ENEMIES",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnRandomEnemies",
			Args = { EnemyCount = 4, },
		},
	},
	-- Give money
	{
		Name = "TwitchIntegration_GIVE_MONEY",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "GiveMoney",
			Args = { Amount = 100, },
		},
	},
	-- Remove money
	{
		Name = "TwitchIntegration_REMOVE_MONEY",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "RemoveMoney",
			Args = { Amount = 100, },
		},
	},
	-- Empty super meter
	{
		Name = "TwitchIntegration_EMPTY_SUPER_METER",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "EmptySuperMeter",
			Args = {},
		},
	},
	-- Fill super meter
	{
		Name = "TwitchIntegration_FILL_SUPER_METER",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "FillSuperMeter",
			Args = {},
		},
	},
	-- Disable dash
	{
		Name = "TwitchIntegration_DISABLE_DASH",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = false,
		Action =
		{
			Name = "DisableDash",
			Args = {},
		},
	},
	-- Kill all enemies and traps
	{
		Name = "TwitchIntegration_ROOM_WIPE",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "RoomWipe",
			Args = {},
		},
	},
	-- Give darkness
	{
		Name = "TwitchIntegration_GIVE_DARKNESS",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "RoomRewardMetaPointDrop", },
		},
	},
	-- Give nectar
	{
		Name = "TwitchIntegration_GIVE_NECTAR",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "GiftDrop", },
		},
	},
	-- Give keys
	{
		Name = "TwitchIntegration_GIVE_KEY",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "LockKeyDrop", },
		},
	},
	-- Give blood
	{
		Name = "TwitchIntegration_GIVE_BLOOD",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "SuperLockKeyDrop", },
		},
	},
	-- Give gems
	{
		Name = "TwitchIntegration_GIVE_GEMS",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "GemDrop", },
		},
	},
	-- Give diamond
	{
		Name = "TwitchIntegration_GIVE_DIAMOND",
		Weight = 1.0,
		EventType = "Resource",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "SpawnConsumable",
			Args = { LootName = "SuperGemDrop", },
		},
	},
	-- Charm all enemies
	{
		Name = "TwitchIntegration_CHARM_ALL_ENEMIES",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = false,
		Action =
		{
			Name = "ApplyEffectToEnemies",
			Args = {},
		},
	},
	-- Spawn mini chariots
	{
		Name = "TwitchIntegration_SPAWN_MINI_CHARIOTS",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = false,
		Action =
		{
			Name = "SpawnEnemies",
			Args = {},
		},
	},
	-- Spawn pests
	{
		Name = "TwitchIntegration_SPAWN_PESTS",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = false,
		Action =
		{
			Name = "SpawnEnemies",
			Args = {},
		},
	},
	--Give chaos boon
	{
		Name = "TwitchIntegration_SPAWN_CHAOS_BOON",
		Weight = 1.0,
		EventType = "Loot",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = false,
		Action =
		{
			Name = "SpawnBoon",
			Args = {},
		},
	},
	-- Hide UI
	{
		Name = "TwitchIntegration_HIDE_UI",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "HideUI",
			Args = {},
		},
	},
	-- Give Yarn of Ariadne
	{
		Name = "TwitchIntegration_GIVE_TEMP_RARITY_BOOST",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "AddTrait",
			Args = {},
		},
	},
	-- Force Chaos gate
	{
		Name = "TwitchIntegration_FORCE_CHAOS_GATE",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "AddTrait",
			Args = {},
		},
	},
	-- Force infernal trove
	{
		Name = "TwitchIntegration_FORCE_TROVE",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "AddTrait",
			Args = {},
		},
	},
	-- Force fishing point
	{
		Name = "TwitchIntegration_FORCE_FISH",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "AddTrait",
			Args = {},
		},
	},
	-- Add Death Defiance
	{
		Name = "TwitchIntegration_ADD_DEFIANCE",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Good",
		ForcedCooldown = 0,
		Enabled = true,
		Action =
		{
			Name = "AddDefiance",
			Args = {},
		},
	},
	-- Spawn Minelayer Boss Battle
	{
		Name = "TwitchIntegration_BOSS_MINELAYER",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 5,
		Enabled = true,
		Action =
		{
			Name = "SpawnMineBoss",
			Args = {},
		},
	},
	-- Spawn Rat thug Boss Battle
	{
		Name = "TwitchIntegration_BOSS_RAT_THUG",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 5,
		Enabled = true,
		Action =
		{
			Name = "SpawnRatBoss",
			Args = {},
		},
	},
	-- Spawn helping hands Boss Battle
	{
		Name = "TwitchIntegration_BOSS_HELPING_HANDS",
		Weight = 1.0,
		EventType = "Spawn",
		EventAlignment = "Bad",
		ForcedCooldown = 5,
		Enabled = true,
		Action =
		{
			Name = "SpawnHandsBoss",
			Args = {},
		},
	},
	{
		Name = "TwitchIntegration_CREATE_DEVOTION_EFFECT",
		Weight = 1.0,
		EventType = "Effect",
		EventAlignment = "Bad",
		ForcedCooldown = 5,
		Enabled = true,
		Action =
		{
			Name = "CreateDevotionEffect",
			Args = {Duration = 15},
		},
	},
}

SaveIgnores["TwitchIntegration.Data"] = true
SaveIgnores["TwitchIntegration.Events"] = true
