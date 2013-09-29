package {
	import org.flixel.*;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class CreditsState extends FlxState {
		public var title:FlxText;
		public var menuButton:FlxButton;
		public var namesGroup:FlxGroup;
		public var name1:FlxText;
		public var name2:FlxText;
		public var name3:FlxText;
		public var name4:FlxText;
		public var name5:FlxText;
		
		public function CreditsState() {
			Mouse.cursor = MouseCursor.AUTO;
			Mouse.show();
			
			title = new FlxText(220, 35, 640, "Credits");
			title.size = 48;
			title.shadow = 0xFF0000;
			add(title);
			
			menuButton = new FlxButton(290, 400, "Back to Menu", showMenu);
			menuButton.scale = new FlxPoint(3, 3);
			add(menuButton);
			
			name1 = new FlxText(215, 135, 640, "Tristan Daniels");
			name2 = new FlxText(215, 175, 640, "Rohan Mahajan");
			name3 = new FlxText(215, 215, 640, "Daniel Martelly");
			name4 = new FlxText(215, 255, 640, "Polina Shpilker");
			name5 = new FlxText(215, 295, 640, "Lili Sun");
			
			namesGroup = new FlxGroup();
			namesGroup.add(name1);
			namesGroup.add(name2);
			namesGroup.add(name3);
			namesGroup.add(name4);
			namesGroup.add(name5);
			namesGroup.setAll("size", 24);
			add(namesGroup);
		}

		public function showMenu():void {
			FlxG.switchState(new MenuState());
		}
	}
}