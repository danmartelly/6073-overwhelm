package  
{
	import flash.utils.Dictionary;
	import org.flixel.*;
	
	public class FallingObject extends FlxSprite
	{
		[Embed(source = "assets/resized/cat.png")] private var ImgCat:Class;
		[Embed(source = "assets/resized/cat_brown.png")] private var ImgCatBrown:Class;
		[Embed(source = "assets/resized/cat_grey.png")] private var ImgCatGrey:Class;
		[Embed(source = "assets/resized/cat_yellow.png")] private var ImgCatYellow:Class;
		[Embed(source = "assets/resized/dog.png")] private var ImgDog:Class;
		[Embed(source = "assets/resized/dog_brown.png")] private var ImgDogBrown:Class;
		[Embed(source = "assets/resized/dog_grey.png")] private var ImgDogGrey:Class;
		[Embed(source = "assets/resized/dog_yellow.png")] private var ImgDogYellow:Class;
		[Embed(source = "assets/resized/fish.png")] private var ImgFish:Class;
		[Embed(source = "assets/resized/fish_brown.png")] private var ImgFishBrown:Class;
		[Embed(source = "assets/resized/fish_grey.png")] private var ImgFishGrey:Class;
		[Embed(source = "assets/resized/fish_yellow.png")] private var ImgFishYellow:Class;
		[Embed(source = "assets/resized/lizard.png")] private var ImgLizard:Class;
		[Embed(source = "assets/resized/lizard_brown.png")] private var ImgLizardBrown:Class;
		[Embed(source = "assets/resized/lizard_grey.png")] private var ImgLizardGrey:Class;
		[Embed(source = "assets/resized/lizard_yellow.png")] private var ImgLizardYellow:Class;
		[Embed(source = "assets/resized/mouse.png")] private var ImgMouse:Class;
		[Embed(source = "assets/resized/mouse_brown.png")] private var ImgMouseBrown:Class;
		[Embed(source = "assets/resized/mouse_grey.png")] private var ImgMouseGrey:Class;
		[Embed(source = "assets/resized/mouse_yellow.png")] private var ImgMouseYellow:Class;
		public var speed:Number;
		private var embeddedObjects:Dictionary; // an array of two strings [animal, color]
		public var categories:Array;
		public var possibleAnimals:Array;
		public var possibleColors:Array;
		
		
		public function FallingObject() 
		{
			super(0,0);
			width = 10;
			height = 10;
			
			maxVelocity.y=200;
			angularVelocity = 10;
			categories = new Array();
			possibleAnimals = new Array();
			possibleAnimals.push("cat");
			possibleAnimals.push("dog");
			possibleAnimals.push("fish");
			possibleAnimals.push("lizard");
			possibleAnimals.push("mouse");
			possibleColors = new Array();
			possibleColors.push("brown");
			possibleColors.push("grey");
			possibleColors.push("yellow");
			
			embeddedObjects = new Dictionary(true);
			//cats
			var catImages:Dictionary = new Dictionary(true);
			catImages[""] = ImgCat;
			catImages["brown"] = ImgCatBrown;
			catImages["grey"] = ImgCatGrey;
			catImages["yellow"] = ImgCatYellow;
			//dogs
			var dogImages:Dictionary = new Dictionary(true);
			dogImages[""] = ImgDog;
			dogImages["brown"] = ImgDogBrown;
			dogImages["grey"] = ImgDogGrey;
			dogImages["yellow"] = ImgDogYellow;
			//fish
			var fishImages:Dictionary = new Dictionary(true);
			fishImages[""] = ImgFish;
			fishImages["brown"] = ImgFishBrown;
			fishImages["grey"] = ImgFishGrey;
			fishImages["yellow"] = ImgFishYellow;
			//lizard
			var lizardImages:Dictionary = new Dictionary(true);
			lizardImages[""] = ImgLizard;
			lizardImages["brown"] = ImgLizardBrown;
			lizardImages["grey"] = ImgLizardGrey;
			lizardImages["yellow"] = ImgLizardYellow;
			//mouse
			var mouseImages:Dictionary = new Dictionary(true);
			mouseImages[""] = ImgMouse;
			mouseImages["brown"] = ImgMouseBrown;
			mouseImages["grey"] = ImgMouseGrey;
			mouseImages["yellow"] = ImgMouseYellow;
			//put it all together
			embeddedObjects["test"] = ImgCat;
			embeddedObjects["cat"] = catImages;
			embeddedObjects["dog"] = dogImages;
			embeddedObjects["fish"] = fishImages;
			embeddedObjects["lizard"] = lizardImages;
			embeddedObjects["mouse"] = mouseImages;
		}
		
		public function init(xPos:int, yPos:int, accel:int, categories:Array):void {
			x = xPos;
			y = yPos;
			velocity.y = 0;
			acceleration.y = accel;
			alive = true;
			exists = true;
			this.categories = categories;
			
			//categories[0] should be an animal categories[1] should be a color (empty string is fine)
			
			
			loadGraphic(embeddedObjects[categories[0]][categories[1]], false);
		}
	}

}