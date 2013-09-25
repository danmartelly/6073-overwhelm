package {
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MenuState extends FlxState {
		public var title:FlxText;
		public var newButton:FlxButton;
		public var instructionsButton:FlxButton;
		public var optionsButton:FlxButton;
		public var creditsButton:FlxButton;

		public function MenuState() {
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			
			title = new FlxText(240, 60, 320, "Overwhelm!");
			title.size = 24;
			title.shadow = 0xFF0000;
			
			newButton = new FlxButton(290, 100, "New Game", newGame);
			instructionsButton = new FlxButton(290, 130, "Instructions", showInstructions);
			optionsButton = new FlxButton(290, 160, "Options", showOptions);
			creditsButton = new FlxButton(290, 190, "Credits", showCredits);
			
			add(title);
			add(newButton);
			add(instructionsButton);
			add(optionsButton);
			add(creditsButton);
		}
		
		public function newGame():void {
			Mouse.hide();
			FlxG.switchState(new PlayState());
		}
		
		public function showInstructions():void {

		}
		
		public function showOptions():void {
			
		}
		
		public function showCredits():void {
			
		}
	}
}