//Headshots from "Critical Shots" by Mikk

const headshot_height = 0.25;

class ER_Brain : eventHandler
	{
	override void worldThingDamaged(worldEvent e)
		{
		if(e.Thing.bISMONSTER)
			{
			// headshots
				actor monster = e.Thing;
				actor source = e.DamageSource;
				actor inflictor = e.Inflictor;
				if(!inflictor || !monster || !source)
					return;
			
		
				// get the lower and upper bounds of the "head".
				int headLower = monster.Floorz + monster.Height-(monster.Height*headshot_height);
				int headUpper = monster.FloorZ + monster.Height;
				// check if the inflictor (i.e. puff, projectile, etc.) is within the bounds of the "head".
				if(inflictor.Pos.Z >= headLower && inflictor.Pos.Z <= headUpper)
				{
					// deal extra damage if above condition is true.
					monster.DamageMobj(source, source, e.Damage*4, 'headshot', DMG_THRUSTLESS);
						
				}
			}
		}
	}