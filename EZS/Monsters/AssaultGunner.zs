Class ER_AssaultGunner : ER_Actor replaces ZombieMan
{
    default
    {
        Health 60;
        Height 56;
        Radius 20;
        Speed 12;
        Mass 100;
        PainChance 170;

        ER_Actor.atkrange 700;


        Tag "Assault Gunner";
        Species "Assault Gunner";

        SeeSound "AssaultGunner/Sight";
        ActiveSound "";
        PainSound "AssaultGunner/Pain";
        DeathSound "AssaultGunner/Death";
        ER_Actor.prepsound "AssaultGunner/Sight";

        Obituary "%O was gunned down by an Assault Gunner!";
    }
    states
    {
        Spawn:
         ZSP2 A 10 A_Look();
         loop;
        See:
         ZSP2 AABBCCDD 4 A_Chase();
         Loop;
        Missile:
         TNT1 A 0{
             if(distance3d(target) <= atkrange-530)
              SetStateLabel("BackFire");
              /*switch (random(1,2))
                {
                    case 1:
                     SetStateLabel("BackFire");
                    case 2:
                     SetStateLabel("Back");
                }*/
         }
         TNT1 A 0 PlayPrepSound();
         ZSP2 E 7 A_Facetarget();
         ZSP2 FFFFFFF 4  Bright{
             A_Facetarget();
             A_StartSound("AssaultGunner/MGun");
             A_SpawnItemEx("RedFlash", 10,7,30);
             A_SpawnProjectile("BulletProjectile",32,7,random(-2,2));
          }
         ZSP2 EA 4;
         Goto See;
        BackFire:
         TNT1 A 0 PlayPrepSound();
         ZSP2 DDCCBBAADDCCBBAADDCCBBAADDCCBBAA 2
         {
             A_Facetarget();
             backup();
         }
         Goto Missile;
        Pain:
         ZSP2 G 10 A_Pain();
         Goto see;
        Death:
         ZSP2 HIJKL 4;
         ZSP2 L -1;
         Stop;
        Death.headshot:
         TNT1 A 0 A_SpawnItemEx("AssaultGunner_head",60,0,0,0,0,10);
         ZSP2 HIJKL 4;
         ZSP2 L -1;
         Stop;
    }

    void backup()
    {
        vector2 dir;

        FLinetraceData R;
        FLinetraceData L;
        FLinetraceData B;

        LineTrace(angle-90,430,20,0,60,0,0,R);
        LineTrace(angle+90,430,20,0,60,0,0,L);
        LineTrace(angle+180,350,20,0,0,60,0,B);

        if (R.HitType == TRACE_HitWall || R.HitType == TRACE_HitActor)
            strafeL(4);
        else if(L.HitType == TRACE_HitWall || L.HitType == TRACE_HitActor)
            strafeR(4);
        if(distance3d(target) <= 330)
            moveB(8);
        else if(B.HitType == TRACE_HitWall)
            moveF(8);
    }
}

Class AssaultGunner_head : Actor
{
    default
    {
        Radius 8;
        Height 8;
        Speed 8;
        BounceFactor 3;
        +DOOMBOUNCE
		+ROLLCENTER
		+ROLLSPRITE
    }
    States
    {
        Spawn:
         ASHD A 6 A_SetRoll(random(0, 359));
         loop;
        Death:
         ASHD A -1;
         stop;
    }
}