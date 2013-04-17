
class Point{
	public var x:Float; 
	public var y:Float;

	public function new(ax:Float, ay:Float)
	{
		x = ax;
		y = ay;
	}

	public function normalize(len)
	{
		var ax:Float; 
		var ay:Float;
		var norm:Float = Math.sqrt(x * x + y * y);
		if (norm == 0) {
			x = 0;
			y = 0;
		}
		else {
			x = len * x / norm;
			y = len * y / norm;
		}
	}
}