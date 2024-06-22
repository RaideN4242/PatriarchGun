class DamTypePGF extends KFProjectileWeaponDamageType
	abstract;

static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount)
{
	KFStatsAndAchievements.AddFlameThrowerDamage(Amount);
	KFStatsAndAchievements.AddMac10BurnDamage(Amount);
}
	
defaultproperties
{
     HeadShotDamageMult=1.5
     bDealBurningDamage=True
     WeaponClass=Class'ServerPerksDZ.PatGun'
     DeathString="%k killed %o (Patty Gun)."
     FemaleSuicide="%o shot herself in the foot."
     MaleSuicide="%o shot himself in the foot."
     bRagdollBullet=True
     KDamageImpulse=15500.000000
     KDeathVel=575.000000
     KDeathUpKick=85.000000
}
