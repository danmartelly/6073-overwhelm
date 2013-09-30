package  
{
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class EndState extends FlxState
	{
		public var fscore:Number;
		public var endText1:FlxText;
		public var endText2:FlxText;
		public var playButton:FlxButton;
		public var menuButton:FlxButton;
		
		public function EndState(s:Number) 
		{
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			
			endText1 = new FlxText(160, 35, 640, "GAME OVER!");
			endText1.size = 48;
			endText1.shadow = 0xFF0000;
			add(endText1);
			endText2 = new FlxText(260, 100, 150, "You ran out of lives!\nYour score: " + s);
			endText2.alignment = "center";
			add(endText2);
			
			playButton = new FlxButton(290, 150, "Play Again?", playagain);
			playButton.scale.make(3, 3);
			menuButton = new FlxButton(290, 210, "Back to Menu", showMenu);
			menuButton.scale.make(3, 3);
			
			add(playButton);
			add(menuButton);
			
		}
		
		public function playagain():void
		{
			Mouse.hide();
			FlxG.switchState(new PlayState());
		}
		
		public function showMenu():void {
			FlxG.switchState(new MenuState());
		}
		
	}

}