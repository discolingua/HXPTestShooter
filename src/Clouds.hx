import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

class Clouds extends Entity 
{
	private var sprite:Spritemap;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		sprite = new Spritemap("gfx/clouds.png", 493, 846);
		graphic = sprite;
		layer = 100;
	}

	override public function update()
	{
		y += 1;

		if (y == 0) {
			scene.add(new Clouds(0, -846));
		}

		if (y > 640) {
			scene.remove(this);
		}
		
		super.update();
	}
}