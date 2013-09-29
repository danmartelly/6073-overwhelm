package {
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class MenuState extends FlxState {
		public var title:FlxText;
		public var buttonGroup:FlxGroup;
		public var newButton:FlxButton;
		public var instructionsButton:FlxButton;
		public var creditsButton:FlxButton;

		public function MenuState() {
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			
			title = new FlxText(160, 35, 640, "Overwhelm!");
			title.size = 48;
			title.shadow = 0xFF0000;
			add(title);
			
			buttonGroup = new FlxGroup();
			newButton = new FlxButton(290, 150, "New Game", newGame);
			instructionsButton = new FlxButton(290, 210, "Instructions", showInstructions);
			creditsButton = new FlxButton(290, 270, "Credits", showCredits);
			
			buttonGroup.add(newButton);
			buttonGroup.add(instructionsButton);
			buttonGroup.add(creditsButton);
			buttonGroup.setAll("scale", new FlxPoint(3, 3));
			add(buttonGroup);
		}
		
		public function newGame():void {
			Mouse.hide();
			FlxG.switchState(new PlayState());
		}
		
		public function showInstructions():void {
			FlxG.switchState(new InstructionsState());
		}
		
		public function showCredits():void {
			FlxG.switchState(new CreditsState());
		}
	}
}