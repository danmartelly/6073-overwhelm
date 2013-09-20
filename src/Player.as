package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		//Player vars
		public var player_height = 10;
		public var player_width = 20;
		
		public function Player(X:int,Y:int) 
		{
			super(X, Y);
			makeGraphic(player_width, player_height, 0xffff0000);
			maxVelocity.x = 160;
			drag.x = maxVelocity.x * 6;
		}
		
		override public function update():void
		{
			//Player movement
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
				acceleration.x = -maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				acceleration.x = maxVelocity.x*4;
		}
	}

}