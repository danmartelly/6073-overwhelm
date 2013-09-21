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
			velocity.y = 0;
			acceleration.y = 80;
			
			makeGraphic(width, height, 0xffaaaaaa);
		}
	}

}