import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;

class Score extends Entity 
{
	private var scoreText:Text;
	public var score:Int = 0;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		//trace("super");

		scoreText = new Text("score", 10, 10);
		scoreText.size = 30;
		graphic = scoreText;
		layer = -10;
	}

	override public function update()
	{
		scoreText.text = Std.string("Score: " + score + " FPS:" + HXP.frameRate);
		//addScore(10);
		//trace("Text made it.");
		super.update();
	}

	public function addScore(points:Int)
	{
		score += points;
	}
}