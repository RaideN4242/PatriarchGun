//=============================================================================
// HuskGunAmmoPickup
//=============================================================================
// Ammo pickup class for the Husk Gun primary fire
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class PatGunAmmoPickup extends KFAmmoPickup;

defaultproperties
{
     AmmoAmount=200
     InventoryType=Class'ServerPerksDZ.PatGunAmmo'
     PickupMessage="Patriarch Gun Bullets"
     StaticMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh'
     CollisionRadius=25.000000
}
