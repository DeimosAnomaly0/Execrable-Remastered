Extend Class ER_Actor
{
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

    void moveB(double dospeed)
    {
        vector2 B = Vec2angle(dospeed,angle-180);

        Trymove(B,BDROPOFF);
    }

    void moveF(double dospeed)
    {
        vector2 F = Vec2angle(dospeed,angle);

        Trymove(F,BDROPOFF);
    }
}