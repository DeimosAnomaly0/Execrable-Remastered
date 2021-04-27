Class RedFlash : Actor
{
    default
    {
        +NOINTERACTION
        +BRIGHT
        +NOCLIP
		+ROLLCENTER
		+ROLLSPRITE
        Renderstyle "Add";
        Radius 1;
        Height 1;
        Scale 0.25;
    }
    override void PostBeginPlay()
    {
        A_SetRoll(random(0, 359));
        Super.PostBeginPlay();
    }
    states
    {
        spawn:
         MUZZ A 3;
         stop;
    }
}