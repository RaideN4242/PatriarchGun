//=============================================================================
// HuskGunPickup
//=============================================================================
// Husk Gun pickup class
//=============================================================================
// Killing Floor Source
// Copyright (C) 2011 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class PatGunPickup extends KFWeaponPickup;

defaultproperties
{
//	Veterancy(0) = Class'SRVetCommando'
//	Veterancy(1) = Class'SRVetFirebug'
//	Veterancy(2) = Class'SRVetProtonSpecial'
//	 StartLevel = 5
//	 LastLevel=99
	Weight=0.000000
	cost=3000
	AmmoCost=30
	BuyClipSize=300
	PowerValue=100
	SpeedValue=100
	RangeValue=100
	Description="The Patriarch's gun."
	SecondaryAmmoShortName="Pat's rockets"
	ItemName="Patriarch Chaingun"
	ItemShortName="Patty Gun"
	AmmoItemName="Pat Gun Bullets"
	AmmoMesh=StaticMesh'KillingFloorStatics.FT_AmmoMesh'
	UV2Texture=none
	CorrespondingPerkIndex=3
	EquipmentCategoryID=3
	MaxDesireability=0.790000
	InventoryType=Class'ServerPerksDZ.PatGun'
	PickupMessage="You got the Patriarch's chaingun."
	PickupSound=Sound'KF_HuskGunSnd.foley.Husk_Pickup'
	PickupForce="AssaultRiflePickup"
	StaticMesh=StaticMesh'kf_gore_trip_sm.limbs.Patriarch_Gun_Arm_Resource'
	CollisionRadius=25.000000
	CollisionHeight=10.000000
}
