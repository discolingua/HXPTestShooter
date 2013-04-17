import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Sfx;

class Player extends Entity
{
	private var sprite:Spritemap;
	private var shotTimer:Int = 10;
	//public var score:Int = 0;
	private var scr:Score;
	private var shot:Sfx;
	private var t:com.haxepunk.utils.Touch;
	
	public function new(x:Float, y:Float, e:Score)
	{
		super(x, y);

		sprite = new Spritemap("gfx/player.png", 46, 60);
		sprite.add("anim", [0, 1], 10, true);
		sprite.centerOrigin();
		graphic = sprite;
		layer = 0;
		type="plyr";

		scr = e;

		shot = new Sfx("snd/Laser_Shoot4.wav");
		sprite.play("anim");
		
		setHitbox(46, 60);
	}

	override public function update()
	{
#if !iphone
		if (Input.check(Key.LEFT)) {
			x -= 4;

			if (sprite.angle < 20) {
				sprite.angle += 2;
			}
		}

		if (Input.check(Key.RIGHT)) {
			x += 4;

			if (sprite.angle > -20) {
				sprite.angle -= 2;
			}
		}

		if (!Input.check(Key.RIGHT) && !Input.check(Key.LEFT)) {
			if (sprite.angle > 0) {
				sprite.angle -= 2;
			}
			else if (sprite.angle < 0) {
				sprite.angle += 2;
			}
		}
#end

#if iphone
		if (t == null) {
			if (sprite.angle > 0) {
				sprite.angle -= 2;
			}
			else if (sprite.angle < 0) {
				sprite.angle += 2;
			}
		}
		t = null;
#end

		timers();
		shotCheck();
		checkBounds();

		super.update();
	}

	private function timers()
	{
		if (shotTimer > 0) {
			shotTimer -= 1;
		}
	}

	private function shotCheck()
	{
		if (Input.check(Key.SPACE)) {
			if (shotTimer <= 0) {
				scene.add(new PlayerShot(x - 12, y - 10, sprite.angle, scr));
				shot.play();
				shotTimer = 20;
			}
		}
	}

	private function checkBounds()
	{
		if (x >= 480-23) {
			x = 480 - 23;
		}
		else if (x <= 23) {
			x = 23;
		}
	}

#if iphone
	private function onTouch(touch:com.haxepunk.utils.Touch)
	{
		t = touch;

		if (touch.sceneX < 240 && touch.sceneY > 320) {
			x -= 4;

			if (sprite.angle < 20) {
				sprite.angle += 2;
			}
		}
		else if (touch.sceneX > 240 && touch.sceneY > 320) {
			x += 4;

			if (sprite.angle > -20) {
				sprite.angle -= 2;
			}
		}
		
		if (touch.sceneY < 320) {
			if (shotTimer <= 0) {
				scene.add(new PlayerShot(x - 12, y - 10, sprite.angle, scr));
				shot.play();
				shotTimer = 20;
			}
		}
	}
#end
}
