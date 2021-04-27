Class ER_AssaultGunner : ER_Actor replaces ZombieMan
{
    default
    {
        Health 90;
        Height 60;
        Radius 20;
        Speed 7;
        PainChance 170;

        ER_Actor.atkrange = 700;


        Tag "Assault Gunner";
        Species "Assault Gunner";

        SeeSound "";
        ActiveSound "";
        PainSound "";
        DeathSound "";
        ER_Actor.prepsound "";

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
        Pain:
         ZSP2 G 10 A_Pain();
         Goto see;
        Death:
         ZSP2 HIJKL 2;
         ZSP2 L -1;
         Stop;
    }
}