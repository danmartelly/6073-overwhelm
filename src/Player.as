package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var score:Number;
		//Player vars
		public var player_height:Number = 10;
		public var player_width:Number = 20;
		
		public function Player(X:int,Y:int) 
		{
			super(X, Y);
			makeGraphic(player_width, player_height, 0xffff0000);
			maxVelocity.x = 160;
			drag.x = maxVelocity.x * 6;
			score = 0;
			health = 5;
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
		
		override public function hurt(damage:Number):void
		{
			if (damage < 0) {
				// you caught a good object, increase your score
				score += 1;
			} else {
				// you hurt your health variable
				super.hurt(damage);
			}
		}
	}

}