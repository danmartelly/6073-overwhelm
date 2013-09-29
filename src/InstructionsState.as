package {
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class InstructionsState extends FlxState {
		public var title:FlxText;
		public var menuButton:FlxButton;
		public var instructions:FlxText;
		
		public function InstructionsState() {
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			
			title = new FlxText(160, 35, 640, "Instructions");
			title.size = 48;
			title.shadow = 0xFF0000;
			add(title);
			
			menuButton = new FlxButton(290, 400, "Back to Menu", showMenu);
			menuButton.scale = new FlxPoint(3, 3);
			add(menuButton);
			
			instructions = new FlxText(180, 145, 320, "Use the left and right arrow keys to control the box.\n\nUse the box to catch the 'goal' animal (shown to the right of the playing screen), which changes as the game goes on.\n\nBut watch out! Missing the 'goal' animal or catching any other animals will cause you to lose a life! ");
			instructions.size = 12;
			add(instructions);
		}

		public function showMenu():void {
			FlxG.switchState(new MenuState());
		}
	}
}