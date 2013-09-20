package  
{
	import org.flixel.*;
	
	public class FallingObject extends FlxSprite
	{
		
		public var speed:Number;
		
		public function FallingObject() 
		{
			super();
			width = 10;
			height = 10;
			
			speed = -50;
			maxVelocity.y=-200;
			angularVelocity = 1;
			
			makeGraphic(width, height, 0xffaaaaaa);
		}
		
		override public function update():void 
		{
			if (!alive)
			{
				if (finished)
				{
					
				}
			}
		}
		
		public function init(xPos:int, yPos:int):void
		{
			x = xPos;
			y = yPos;
		}
	}

}