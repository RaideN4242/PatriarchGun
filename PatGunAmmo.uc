// HuskGunAmmo
//=============================================================================
// Ammo for the Husk Gun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class PatGunAmmo extends KFAmmunition;

defaultproperties
{
     AmmoPickupAmount=300
     MaxAmmo=2000
     InitialAmount=600
     PickupClass=Class'ServerPerksDZ.PatGunAmmoPickup'
     IconMaterial=Texture'KillingFloorHUD.Generic.HUD'
     IconCoords=(X1=4,Y1=350,X2=110,Y2=395)
     ItemName="bullets"
}
