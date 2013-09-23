package  
{
	import org.flixel.*;
	public class EndState extends FlxState
	{
		public var fscore:Number;
		public var endText1:FlxText;
		public var endText2:FlxText;
		public var playButton:FlxButton;
		
		public function EndState(s:Number) 
		{
			endText1 = new FlxText(90, 30, 150, "GAME OVER!");
			endText1.alignment = "center";
			add(endText1);
			endText2 = new FlxText(90, 40, 150, "Your score: " + s);
			endText2.alignment = "center";
			add(endText2);
			
			playButton = new FlxButton(127, 60, "Play Again?", playagain);
			
			add(playButton);
			
		}
		
		public function playagain()
		{
			FlxG.switchState(new PlayState());
		}
		
	}

}