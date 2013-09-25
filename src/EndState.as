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
			
			endText1 = new FlxText(240, 60, 300, "GAME OVER!");
			endText1.size = 24;
			endText1.shadow = 0xFF0000;
			add(endText1);
			endText2 = new FlxText(290, 100, 150, "Your score: " + s);
			add(endText2);
			
			playButton = new FlxButton(285, 120, "Play Again?", playagain);
			menuButton = new FlxButton(285, 140, "Back to Menu", showMenu);
			
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