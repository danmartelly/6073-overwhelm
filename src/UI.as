package  
{
	import org.flixel.*;
	
	public class UI extends FlxGroup
	{
		//UI Vars
		protected var barwidth:Number = 10;
		protected var uicolor:Number = 0xff009999;
		
		//UI 1 - Big right bar
		protected var menuwidth:Number = 160;
		public var upperbar:FlxSprite = new FlxSprite(5, 0);
		public var lowerbar:FlxSprite = new FlxSprite(5, 480 - barwidth);
		public var leftbar:FlxSprite = new FlxSprite(0, 0);
		public var rightbar:FlxSprite = new FlxSprite(640 - menuwidth, 0);
		public var scorelabel:FlxText = new FlxText(484, 5, 40, "Score:");
		public var scorevallabel:FlxText = new FlxText(496, 15, 60, "INFINITY!!!");
		public var liveslabel:FlxText = new FlxText(484, 30, 40, "Lives:");
		public var livesvallabel:FlxText = new FlxText(496, 40, 60, "INFINITY!!!");
		public var goallabel:FlxText = new FlxText(536, 205, 40, "Goal:");
		public var goalimage:Array = new Array();//277, 220);
		
		
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
			upperbar.makeGraphic(480, barwidth, uicolor);
			lowerbar.makeGraphic(480, barwidth, uicolor);
			leftbar.makeGraphic(barwidth, 480, uicolor);
			rightbar.makeGraphic(menuwidth, 480, uicolor);
			
			//UI 2 - Big lower bar
			/*
			upperbar.makeGraphic(320, barwidth, uicolor);
			lowerbar.makeGraphic(320, menuwidth, uicolor);
			leftbar.makeGraphic(barwidth, 240, uicolor);
			rightbar.makeGraphic(barwidth, 240, uicolor);
			*/
			
			//goalimage.makeGraphic(10, 10, 0xffaaaaaa);
			for(var i:int=0;i<5;i++){
				goalimage[i]=new FallingObject();
			}
			goalimage[0].init(520,220,0,["fish",""]);
			goalimage[1].init(560,220,0,["fish","brown"]);
			goalimage[2].init(520,260,0,["fish","grey"]);
			goalimage[3].init(560,260,0,["fish","yellow"]);
			
			this.add(upperbar);
			this.add(lowerbar);
			this.add(leftbar);
			this.add(rightbar);
			this.add(scorelabel);
			this.add(scorevallabel);
			this.add(liveslabel);
			this.add(livesvallabel);
			this.add(goallabel);
			for(var k:int=0; k<5; k++){
				this.add(goalimage[k]);
			}
		}
		
		public function updateUI(score:Number, health:Number, target:Array):void {
			scorevallabel.text = "" + score;
			livesvallabel.text = "" + health;
			goalimage=target;
		}
	}
}