package  
{
	import org.flixel.*;
	
	public class FallingObject extends FlxSprite
	{
		
		public var speed:Number;
		
		public function FallingObject() 
		{
			super(0,0);
			width = 10;
			height = 10;
			
			maxVelocity.y=200;
			angularVelocity = 10;
		}
		
		public function init(xPos:int, yPos:int):void
		{
			x = xPos;
			y = yPos;
			velocity.y = 0;
			acceleration.y = 80;
			alive = true;
			exists = true;
			
			makeGraphic(width, height, 0xffaaaaaa);
		}
	}

}