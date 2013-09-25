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
			
			endText1 = new FlxText(85, 30, 150, "GAME OVER!");
			endText1.alignment = "center";
			add(endText1);
			endText2 = new FlxText(85, 40, 150, "Your score: " + s);
			endText2.alignment = "center";
			add(endText2);
			
			playButton = new FlxButton(120, 60, "Play Again?", playagain);
			menuButton = new FlxButton(120, 90, "Back to Menu", showMenu);
			
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