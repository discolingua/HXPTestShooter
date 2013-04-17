import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;

class PlayerShot extends Entity
{
	private var sprite:Spritemap;
	private var dir:Float;
	private var scr:Score;
	private var hit:Sfx;
	
	public function new(x:Float, y:Float, d:Float, e:Score)
	{
		super(x, y);

		sprite = new Spritemap("gfx/plyrshot.png", 24, 20);
		graphic = sprite;
		layer = 4;
		type="plyrshot";
		dir = d;
		sprite.angle = dir;
		scr = e;

		hit = new Sfx("snd/Explosion2.wav");
		
		setHitbox(24, 20);
	}

	override public function update()
	{
		//y -= 3;
		move();
		checkBounds();
		checkCollision();

		super.update();
	}

	private function checkBounds()
	{
		if (y <= -20) {
			scene.remove(this);
		}
		if (x <= -20) {
			scene.remove(this);
		}
		if (x >= 480) {
			scene.remove(this);
		}
	}

	private function checkCollision()
	{
		var en = collide("enemy", x, y);

		if (en != null) {
			scr.addScore(10);
			hit.play();
			scene.remove(en);
			scene.remove(this);
		}
	}

	private function move()
	{
		var newang:Float = degreeradian(dir) - degreeradian(90);

		x = x - 5*Math.cos(newang)*1;
		y = y + 5*Math.sin(newang)*1;

		/*var newx = calculatex(x, newang, 400);
		var newy = calculatex(y, newang, 400);
		var newdir:Point = new Point(newx - x, newy - y);

		newdir.normalize(3);

		x += newdir.x;
		y += newdir.y;*/
	}

	private function degreeradian(a:Float)
	{
		return a * 0.017453292519;
	}

	/*private function calculatex(x:Float, angle:Float, len:Float)
	{
		return x + len * Math.cos(angle);
	}

	private function calculatey(y:Float, angle:Float, len:Float)
	{
		return y + len * Math.sin(angle);
	}*/
}