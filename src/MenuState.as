package {
	import org.flixel.*;
	
	public class MenuState extends FlxState {
		public var title:FlxText;
		public var newButton:FlxButton;
		public var instructionsButton:FlxButton;
		public var optionsButton:FlxButton;
		public var creditsButton:FlxButton;

		public function MenuState() {
			title = new FlxText(80, 20, 320, "Overwhelm!");
			title.size = 24;
			title.shadow = 0xFF0000;
			
			newButton = new FlxButton(120, 60, "New Game", newGame);
			instructionsButton = new FlxButton(120, 90, "Instructions", showInstructions);
			optionsButton = new FlxButton(120, 120, "Options", showOptions);
			creditsButton = new FlxButton(120, 150, "Credits", showCredits);
			
			add(title);
			add(newButton);
			add(instructionsButton);
			add(optionsButton);
			add(creditsButton);
		}
		
		public function newGame():void {
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