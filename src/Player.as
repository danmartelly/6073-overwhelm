package  
{
	import flash.sensors.Accelerometer;
	
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var score:Number;
		//Player vars
		public var player_height:Number = 10;
		public var player_width:Number = 20;
		
		
		[Embed(source = "assets/player.png")] private var playerImg:Class;
		
		//keeps track of which objects the player will get points for catching
		public var player_target:Array;
		
		public function Player(X:int,Y:int,target:Array) 
		{
			super(X, Y);
			//makeGraphic(player_width, player_height, 0xffff0000);
			maxVelocity.x = 160;
			drag.x = maxVelocity.x * 6;
			score = 0;
			health = 5;
			player_target=target;
			loadGraphic(playerImg, false,false,70,35);
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
		
		public function setTarget(newTarget:Array):void
		{
			player_target=newTarget;
		}
		
		public function getTarget():Array
		{
			return player_target;
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
		
		override public function kill():void
		{
			FlxG.switchState(new EndState(score));
		}
	}

}