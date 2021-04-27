Extend Class ER_Actor
{
    Protected void PreDie()
    {
        A_Scream();
        A_NoBlocking();
    }

    void PlayPrepSound()
    {
        A_StartSound(prepsound);
    }

    void strafeL(double dospeed = 0.5)
    {
        vector2 L = Vec2angle(dospeed,angle+90);

        Trymove(L,BDROPOFF);
    }

    void strafeR(double dospeed)
    {
        vector2 R = Vec2angle(dospeed,angle-90);

        Trymove(R,BDROPOFF);
    }
}