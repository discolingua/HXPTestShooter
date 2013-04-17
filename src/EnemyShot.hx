import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;

class EnemyShot extends Entity
{
	private var sprite:Spritemap;
	private var hit:Sfx;
	
	public function new(x:Float, y:Float)
	{
		super(x - 11, y - 20);

		sprite = new Spritemap("gfx/enemyshot.png", 24, 20);
		graphic = sprite;
		layer = 8;
		type="enemyshot";
		sprite.angle = 180;

		hit = new Sfx("snd/Explosion4.wav");
		
		setHitbox(24, 20);
	}

	override public function update()
	{
		y += 4;

		if (y >= 640) {
			scene.remove(this);
		}

		var pl = collide("plyr", x, y);

		if (pl != null) {
			hit.play();
			scene.remove(pl);
			scene.remove(this);
		}
	}
}