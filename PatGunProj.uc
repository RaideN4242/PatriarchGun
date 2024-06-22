class PatGunProj extends LAWProj;

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local PlayerController  LocalPlayer;

	bHasExploded = True;
	BlowUp(HitLocation);

	// Incendiary Effects..
	PlaySound(sound'KF_GrenadeSnd.FlameNade_Explode',,100.5*TransientSoundVolume);

	if ( EffectIsRelevant(Location,false) )
	{
		Spawn(Class'KFIncendiaryExplosion',,, HitLocation, rotator(vect(0,0,1)));
		Spawn(ExplosionDecal,self,,HitLocation, rotator(-HitNormal));
	}

	// Shake nearby players screens
	LocalPlayer = Level.GetLocalPlayerController();
	if ( (LocalPlayer != None) && (VSize(Location - LocalPlayer.ViewTarget.Location) < (DamageRadius * 1.5)) )
		LocalPlayer.ShakeView(RotMag, RotRate, RotTime, OffsetMag, OffsetRate, OffsetTime);
	Destroy();
}

defaultproperties
{
    // ExplosionSound="KF_GrenadeSnd.Nade_Explode_1"
    // DisintegrateSound="Inf_Weapons.faust_explode_distant02"
     MyDamageType=Class'ServerPerksDZ.DamTypePatGunProj'
	 Damage=200.000000
	  ArmDistSquared=00000.000000
}
