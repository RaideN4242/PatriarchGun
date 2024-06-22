class PatGunFire extends KFHighROFFire;

function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X,Y,Z, End, HitLocation, HitNormal, ArcEnd;
	local Actor Other;
	local byte HitCount,HCounter;
	local float HitDamage;
	local array<int>	HitPoints;
	local KFPawn HitPawn;
	local array<Actor>	IgnoreActors;
	local Actor DamageActor;
	    local KFPlayerReplicationInfo KFPRI;
	local int i;
	MaxRange();
	Weapon.GetViewAxes(X, Y, Z);
	
	//	DamageType = SRPlayerReplicationInfo(Instigator.PlayerReplicationInfo).ClientVeteranSkill.static.GetPatgunDamageType(SRPlayerReplicationInfo(Instigator.PlayerReplicationInfo));
		
		 KFPRI = KFPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
    if ( KFPRI != none && KFPRI.ClientVeteranSkill == Class'SRVetFirebug'  )
      DamageType=default.DamageType;
    else
      DamageType=Class'DamTypePG';
  //  ProjPerFire=default.ProjPerFire;
	
		
		
	if ( Weapon.WeaponCentered() )
	{
		ArcEnd = (Instigator.Location + Weapon.EffectOffset.X * X + 1.5 * Weapon.EffectOffset.Z * Z);
	}
	else
    {
        ArcEnd = (Instigator.Location + Instigator.CalcDrawOffset(Weapon) + Weapon.EffectOffset.X * X +
		 Weapon.Hand * Weapon.EffectOffset.Y * Y + Weapon.EffectOffset.Z * Z);
    }
	X = Vector(Dir);
	End = Start + TraceRange * X;
	HitDamage = DamageMax;
	While( (HitCount++)<10 )
	{
        DamageActor = none;
		Other = Instigator.HitPointTrace(HitLocation, HitNormal, End, HitPoints, Start,, 1);
		if( Other==None )
		{
			Break;
		}
		else if( Other==Instigator || Other.Base == Instigator )
		{
			IgnoreActors[IgnoreActors.Length] = Other;
			Other.SetCollision(false);
			Start = HitLocation;
			Continue;
		}
		if( ExtendedZCollision(Other)!=None && Other.Owner!=None )
		{
            IgnoreActors[IgnoreActors.Length] = Other;
            IgnoreActors[IgnoreActors.Length] = Other.Owner;
			Other.SetCollision(false);
			Other.Owner.SetCollision(false);
			DamageActor = Pawn(Other.Owner);
		}
		if ( !Other.bWorldGeometry && Other!=Level )
		{
			HitPawn = KFPawn(Other);
	    	if ( HitPawn != none )
	    	{
                 if(!HitPawn.bDeleteMe)
				 	HitPawn.ProcessLocationalDamage(int(HitDamage), Instigator, HitLocation, Momentum*X,DamageType,HitPoints);
                IgnoreActors[IgnoreActors.Length] = Other;
                IgnoreActors[IgnoreActors.Length] = HitPawn.AuxCollisionCylinder;
    			Other.SetCollision(false);
    			HitPawn.AuxCollisionCylinder.SetCollision(false);
    			DamageActor = Other;
			}
            else
            {
    			if( KFMonster(Other)!=None )
    			{
                    IgnoreActors[IgnoreActors.Length] = Other;
        			Other.SetCollision(false);
        			DamageActor = Other;
    			}
    			else if( DamageActor == none )
    			{
                    DamageActor = Other;
    			}
    			Other.TakeDamage(int(HitDamage), Instigator, HitLocation, Momentum*X, DamageType);
			}
			if( (HCounter++)>=4 || Pawn(DamageActor)==None )
			{
				Break;
			}
			HitDamage*=0.8;
			Start = HitLocation;
		}
		else if ( HitScanBlockingVolume(Other)==None )
		{
			if( KFWeaponAttachment(Weapon.ThirdPersonActor)!=None )
		      KFWeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Other,HitLocation,HitNormal);
			Break;
		}
	}
	for (i=0; i<IgnoreActors.Length; i++)
	{
		if(IgnoreActors[i]!=none)
			IgnoreActors[i].SetCollision(true);
	}
}


defaultproperties
{
     FireEndSound=Sound'KF_BasePatriarch.Attack.Kev_MG_TurbineWindDown'
     AmbientFireSound=Sound'KF_BasePatriarch.Attack.Kev_MG_GunfireLoop'
     RecoilRate=0.005000
     maxVerticalRecoilAngle=10
     maxHorizontalRecoilAngle=10
     RecoilVelocityScale=0.000000
     ShellEjectClass=Class'ServerPerksDZ.PattyShellEject'
     ShellEjectBoneName="Barrel"
     DamageType=Class'ServerPerksDZ.DamTypePGF'
     DamageMax=300
     Momentum=5500.000000
     FireLoopAnim="FireLoop"
     FireEndAnim="FireLoopEnd"
     FireRate=0.100000
     AmmoClass=Class'ServerPerksDZ.PatGunAmmo'
     ShakeRotMag=(X=25.000000,Y=25.000000,Z=125.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=0.000000
     ShakeOffsetMag=(X=4.000000,Y=2.500000,Z=5.000000)
     ShakeOffsetRate=(X=1000.000000,Y=1000.000000,Z=1000.000000)
     ShakeOffsetTime=1.250000
     FlashEmitterClass=Class'ROEffects.MuzzleFlash1stMG'
     Spread=0.005
     SpreadStyle=SS_Random
}
