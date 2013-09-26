package  
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		//some parameters
		private var _newObjectGenerationRate:Number = 1;
		private var _newObjectiveChangeRate:Number = 7;
		
		public var paused:Boolean;
		public var pauseGroup:FlxGroup;
		public var pauseText:FlxText;
		public var keyText:FlxText;
		public var shipImg:FlxSprite = new FlxSprite( -70, -170);
		public var bgImg:FlxSprite = new FlxSprite(0, 0);
		
		
		//major game object storage
		protected var _player:Player;
		protected var _fallingObjects:FlxGroup;
		protected var _ui:UI;
		
		private var _timer:Number;
		private var _timeLastObjectDropped:Number;
		private var _timeObjectiveLastChanged:Number;
		private var _counter:int;
		//embedding sounds, images, etc
		[Embed(source = "sfx/good.mp3")] var sfxGood:Class;
		[Embed(source = "sfx/bad.mp3")] var sfxBad:Class;
		[Embed(source = "assets/ship.png")] private var ImgShip:Class;		
		
		override public function create():void
		{	
			bgImg.makeGraphic(640, 480, 0xffCFEBED);
			add(bgImg);
			_timer = 0;
			_timeLastObjectDropped = -100;
			_timeObjectiveLastChanged = -100;
			
			//Adding the player.
			
			//giving the player a target
			var targetObj:FallingObject=new FallingObject();
			targetObj.init(0,0,0,["fish",""]);
			
			//UI 1 - Big right bar
			_player = new Player(240, 460, targetObj);
			//UI 2 - Big bottom bar
			//_player = new Player(155, 200);
			add(_player);
			
			//Adding falling objects
			_fallingObjects = new FlxGroup();
			add(_fallingObjects);
			
			//Adding UI
			_ui = new UI();
			add(_ui);
			
			shipImg.loadGraphic(ImgShip);
			shipImg.acceleration.y = 50
			add(shipImg);
			
			//Add objects that will appear on the pause screen to pauseGroup
			paused = false;
			pauseText = new FlxText(170, 190, 320, "Game Paused");
			pauseText.alignment = "center";
			pauseText.size = 18;
			keyText = new FlxText(170, 210, 320, "'P' to unpause \n'Q' to quit to menu");
			keyText.alignment = "center";
			
			pauseGroup = new FlxGroup();
			pauseGroup.add(pauseText);
			pauseGroup.add(keyText);
			/*pauseGroup.add(_ui.upperbar);
			pauseGroup.add(_ui.lowerbar);
			pauseGroup.add(_ui.leftbar);
			pauseGroup.add(_ui.rightbar);
			pauseGroup.add(_ui.scorelabel);
			pauseGroup.add(_ui.scorevallabel);
			pauseGroup.add(_ui.liveslabel);
			pauseGroup.add(_ui.livesvallabel);
			pauseGroup.add(_ui.goallabel);*/
		}
		
		override public function destroy():void
		{
			super.destroy();
			
			_fallingObjects = null;
		}
		
		override public function update():void
		{
			//The "P" key toggles pausing. The "Q" key quits to menu when game is paused.
			//If the game is paused, only update the elements in pauseGroup.
			if (shipImg.y > -170) 
				shipImg.acceleration.y = -50;
			if (shipImg.y < -170)
				shipImg.acceleration.y = 50;
			if (FlxG.keys.justPressed("P"))
				paused = !paused;
			if (paused) {
				if (FlxG.keys.justPressed("Q"))
					FlxG.switchState(new MenuState());
				else
					return pauseGroup.update();
			}
			
			//collisions
			FlxG.overlap(_fallingObjects, _player, caughtObject);
			FlxG.collide(_ui, _player);
			FlxG.overlap(_fallingObjects, _ui, uncaughtObject);
			
			//update hud
			_ui.updateUI(_player.score, _player.health, _player.getTarget());
			
			//make new falling objects
			_timer += FlxG.elapsed;
			var limit:uint = 1;
			if (_timer - _timeLastObjectDropped > _newObjectGenerationRate)
			{
				_timeLastObjectDropped = _timer;
				_counter +=1;
				if (_counter > 20){
					makeFallingObject(200);
				}
				else if (_counter > 10){
					makeFallingObject(80);
				}
				makeFallingObject(80);
			}
			if (_timer - _timeObjectiveLastChanged > _newObjectiveChangeRate)
			{
				_timeObjectiveLastChanged = _timer;
				
			}

			
			super.update();
		}				
		
		override public function draw():void
		{
			//If the game is paused, only draw the elements in pauseGroup
			if (paused) {
				pauseGroup.setAll("alpha", 0.5);
				pauseText.alpha = 1.0;
				keyText.alpha = 1.0;
				return pauseGroup.draw();
			}
			pauseGroup.setAll("alpha", 1.0);
			super.draw();
		}
		
		public function caughtObject(fallObj:FallingObject, player:FlxSprite):void
		{
			fallObj.kill();
			var target:FallingObject=_player.getTarget();
			var targetCat1:String=target.categories[0];
			var targetCat2:String=target.categories[1];
			var category1:String=fallObj.categories[0];
			var category2:String=fallObj.categories[1];
			if (targetCat1==category1 || targetCat2==category2){
				//only has positive effect if it's the correct target.
				FlxG.play(sfxGood);
				_player.hurt(-1);				
			} else {
				//otherwise bad!!
				FlxG.play(sfxBad);
				_player.hurt(1);				
			}
		}
		
		public function uncaughtObject(fallObj:FallingObject, ui:FlxSprite):void {
			fallObj.kill();
			var target:FallingObject=_player.getTarget();
			var targetCat1:String=target.categories[0];
			var targetCat2:String=target.categories[1];
			var category1:String=fallObj.categories[0];
			var category2:String=fallObj.categories[1];
			if (targetCat1==category1 || targetCat2==category2){
				//only bad if it was a target
				FlxG.play(sfxBad);
				_player.hurt(1);				
			}
		}
		
		public function makeFallingObject(accel:int):void
		{
			var xPos:Number = FlxG.random()*200;
			var yPos:Number = 20;
			var fallObj:FallingObject = (_fallingObjects.recycle(FallingObject) as FallingObject);
			
			if (fallObj == null)
			{
				var newFallObj:FallingObject = new FallingObject();
				_fallingObjects.add(newFallObj);
			}
			
			var categories:Array = new Array();
			categories.push(FlxG.getRandom(fallObj.possibleAnimals)); categories.push(FlxG.getRandom(fallObj.possibleColors));
			fallObj.init(xPos, yPos, accel, categories);
		}
	}
}