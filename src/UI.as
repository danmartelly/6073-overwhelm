package  
{
	import org.flixel.*;
	
	public class UI extends FlxGroup
	{
		//UI Vars
		protected var barwidth:Number = 5;
		protected var uicolor:Number = 0xff009999;
		
		//UI 1 - Big right bar
		protected var menuwidth:Number = 80;
		protected var upperbar:FlxSprite = new FlxSprite(0, 0);
		protected var lowerbar:FlxSprite = new FlxSprite(0, 240 - barwidth);
		protected var leftbar:FlxSprite = new FlxSprite(0, 0);
		protected var rightbar:FlxSprite = new FlxSprite(320 - menuwidth, 0);
		protected var scorelabel:FlxText = new FlxText(242, 5, 40, "Score:");
		protected var scorevallabel:FlxText = new FlxText(248, 15, 60, "INFINITY!!!");
		protected var liveslabel:FlxText = new FlxText(242, 30, 40, "Lives:");
		protected var livesvallabel:FlxText = new FlxText(248, 40, 60, "INFINITY!!!");
		protected var goallabel:FlxText = new FlxText(268, 205, 40, "Goal:");
		protected var goalimage:FlxSprite = new FlxSprite(277, 220);
		
		
		//UI 2 - Big lower bar
		/*
		protected var menuwidth:Number = 30;
		protected var upperbar:FlxSprite = new FlxSprite(0, 0);
		protected var lowerbar:FlxSprite = new FlxSprite(0, 240 - menuwidth);
		protected var leftbar:FlxSprite = new FlxSprite(0, 0);
		protected var rightbar:FlxSprite = new FlxSprite(320 - barwidth, 0);
		protected var scorelabel:FlxText = new FlxText(5, 210, 40, "Score:");
		protected var scorevallabel:FlxText = new FlxText(10, 225, 60, "INFINITY!!!");
		protected var liveslabel:FlxText = new FlxText(70, 210, 40, "Lives:");
		protected var livesvallabel:FlxText = new FlxText(75, 225, 60, "INFINITY!!!");
		protected var goallabel:FlxText = new FlxText(288, 210, 40, "Goal:");
		protected var goalimage:FlxSprite = new FlxSprite(297, 225);
		*/
		
		public function UI() 
		{
			upperbar.immovable = true;
			lowerbar.immovable = true;
			leftbar.immovable = true;
			rightbar.immovable = true;
			
			//UI 1 - Big right bar
			upperbar.makeGraphic(320, barwidth, uicolor);
			lowerbar.makeGraphic(320, barwidth, uicolor);
			leftbar.makeGraphic(barwidth, 240, uicolor);
			rightbar.makeGraphic(menuwidth, 240, uicolor);
			
			//UI 2 - Big lower bar
			/*
			upperbar.makeGraphic(320, barwidth, uicolor);
			lowerbar.makeGraphic(320, menuwidth, uicolor);
			leftbar.makeGraphic(barwidth, 240, uicolor);
			rightbar.makeGraphic(barwidth, 240, uicolor);
			*/
			
			goalimage.makeGraphic(10, 10, 0xffaaaaaa);
			
			this.add(upperbar);
			this.add(lowerbar);
			this.add(leftbar);
			this.add(rightbar);
			this.add(scorelabel);
			this.add(scorevallabel);
			this.add(liveslabel);
			this.add(livesvallabel);
			this.add(goallabel);
			this.add(goalimage);
		}
		
	}

}