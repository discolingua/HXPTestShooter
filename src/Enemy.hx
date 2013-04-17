import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;

class Enemy extends Entity
{
	private var sprite:Spritemap;
	private var dir:Int = 2;
	//private var scr:Score;
	private var shotheight:Int;
	private var shot:Sfx;
	
	public function new(x:Float, y:Float)
	{
		super(x, y);

		sprite = new Spritemap("gfx/enemy.png", 46, 60);
		graphic = sprite;
		layer = 4;
		type="enemy";

		shot = new Sfx("snd/Laser_Shoot2.wav");

		shotheight = Std.random(500);
		//scr = e;
		
		setHitbox(46, 60);
	}

	override public function update()
	{
		if (dir == 1) {
			x += 1;
		}
		if (dir == 0) {
			x -= 1;
		}
		y += 2;

		checkBounds();
		checkDir();
		checkShot();

		super.update();
	}

	override public function removed()
	{
		//scr.addScore(10);
		//trace("Enemy made it.");
	}

	private function checkBounds()
	{
		if (y >= 640) {
			scene.remove(this);
		}
	}

	private function checkDir()
	{
		if (y >= 320) {
			if (x > 240) {
				dir = 1;
			}
			else {
				dir = 0;
			}
		}
	}

	private function checkShot()
	{
		if (y > shotheight - 1 && y < shotheight + 1)
		{
			scene.add(new EnemyShot(x + 46, y + 60));
			shot.play();
		}
	}
}