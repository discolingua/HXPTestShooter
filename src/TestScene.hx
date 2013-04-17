import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;

class TestScene extends Scene
{
	private var plyr:Player;
	private var scr:Score;
	private var spawnTimer:Int = 60;

	public function new()
	{
		super();
	}

	public override function begin()
	{
		scr = new Score(10, 10);
		plyr = new Player((480 / 2) - 23, 575, scr);
		add(plyr);
		add(scr);
		add(new Clouds(0, -1));
	}

	public override function update()
	{
		spawnEnemy();

		super.update();
	}

	private function spawnEnemy()
	{
		if (spawnTimer >= 0) {
			spawnTimer -= 1;
		} else {
			add(new Enemy(Std.random(480), -30));
			spawnTimer = Std.random(60);
		}
	}
}