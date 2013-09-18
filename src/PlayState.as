package  
{
	/**
	 * @author Martelly
	 */
	
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		//Player vars
		public var player:FlxSprite;
		public var player_height = 10;
		public var player_width = 20;
		
		override public function create():void
		{
			add(new FlxText(0, 0, 100, "Overwhelm!"));
			
			//Adding the player.
			player = new FlxSprite(0, 0);
			player.makeGraphic(player_width, player_height, 0xffff0000);
			player.maxVelocity.x = 160;
			player.drag.x = player.maxVelocity.x * 6;
			add(player);
			
		}
		
		override public function update():void
		{
			//Player movement
			player.acceleration.x = 0;
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			
			super.update();
		}						
	}

}