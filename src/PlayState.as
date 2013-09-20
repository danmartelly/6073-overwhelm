package  
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		public var someText:FlxText;
		
		//major game object storage
		protected var _player:Player;
		protected var _fallingObjects:FlxGroup;
		
		private var _timer:Number;
		
		override public function create():void
		{
			someText = new FlxText(0, 0, 100, "Overwhelm!");
			add(someText);
			_timer = 0;
			
			//Adding the player.
			_player = new Player(0, 0);
			add(_player);
			
			//Adding falling objects
			_fallingObjects = new FlxGroup();
		}
		
		override public function destroy():void
		{
			super.destroy();
			
			_fallingObjects = null;
		}
		
		override public function update():void
		{
			//collisions
			FlxG.collide(_fallingObjects, _player);
			
			//make new falling objects
			_timer += FlxG.elapsed;
			someText.text = _timer.toString();
			var limit:uint = 10;
			if (_timer > limit)
			{
				_timer = 0;
				makeFallingObject();
			}
			
			super.update();
		}						
		
		public function makeFallingObject():void
		{
			var xPos:Number = 20;
			var yPos:Number = 20;
			(_fallingObjects.recycle(fallingObject) as fallingObject).init(xPos, yPos);
		}
	}

}