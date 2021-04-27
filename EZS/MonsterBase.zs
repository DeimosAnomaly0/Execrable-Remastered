Class ER_Actor : Actor abstract
{
    int atkrange;
    double renderdist;

    property atkrange : atkrange;

    sound prepsound;

    property prepsound : prepsound;
    default;
    {
        MONSTER;
        +FLOORCLIP
    }

    override void Die(Actor source, Actor inflictor, int dmgflags, Name MeansOfDeath)
    {
        PreDie();
        Super.Die(source, inflictor, dmgflags, MeansOfDeath);
    }

}