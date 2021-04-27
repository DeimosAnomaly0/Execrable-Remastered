Class BulletProjectile : Actor
{
    default
    {
        Projectile;
        height 2;
        radius 2;
        speed 60;
        DamageFunction 1;
        scale 1.2;

        +BLOODSPLATTER
        +THRUGHOST

        RenderStyle "Add";
        Alpha 1.0;
    }
    States
    {
        Spawn:
         BULL A 1 bright;
         loop;
        Death:
         TNT1 A 0;
         stop;
    }
}




