package  
{
	import org.flixel.*;
	 
	public class PlayState extends FlxState
	{
		public var someText:FlxText;
		
		//major game object storage
		protected var _player:Player;
		protected var _fallingObjects:FlxGroup;
		protected var _ui:UI;
		
		private var _timer:Number;
		
		//embedding sounds, images, etc
		[Embed(source = "sfx/good.mp3")] var sfxGood:Class;
		[Embed(source = "sfx/bad.mp3")] var sfxBad:Class;
		
		override public function create():void
		{
			someText = new FlxText(0, 0, 150, "Overwhelm!");
			add(someText);
			_timer = 0;
			
			//Adding the player.
			
			//UI 1 - Big right bar
			_player = new Player(115, 225);
			//UI 2 - Big bottom bar
			//_player = new Player(155, 200);
			add(_player);
			
			//Adding falling objects
			_fallingObjects = new FlxGroup();
			add(_fallingObjects);
			
			//Adding UI
			_ui = new UI();
			add(_ui);
		}
		
		override public function destroy():void
		{
			super.destroy();
			
			_fallingObjects = null;
		}
		
		override public function update():void
		{
			//collisions
			FlxG.overlap(_fallingObjects, _player, caughtObject);
			FlxG.collide(_ui, _player);
			FlxG.overlap(_fallingObjects, _ui, uncaughtObject);
			
			//update hud
			_ui.updateUI(_player.score, _player.health);
			
			//make new falling objects
			_timer += FlxG.elapsed;
			someText.text = _timer.toString();
			var limit:uint = 1;
			if (_timer > limit)
			{
				_timer = 0;
				makeFallingObject();
			}
			
			super.update();
		}				
		
		public function caughtObject(fallObj:FlxSprite, player:FlxSprite):void
		{
			fallObj.kill();
			FlxG.play(sfxGood);
			_player.hurt(-1);
		}
		
		public function uncaughtObject(fallObj:FlxSprite, ui:FlxSprite) {
			fallObj.kill();
			FlxG.play(sfxBad);
			_player.hurt(1);
		}
		
		public function makeFallingObject():void
		{
			var xPos:Number = FlxG.random()*200;
			var yPos:Number = 20;
			var fallObj:FallingObject = (_fallingObjects.recycle(FallingObject) as FallingObject);
			
			if (fallObj == null)
			{
				var newFallObj:FallingObject = new FallingObject();
				_fallingObjects.add(newFallObj);
			}
			fallObj.init(xPos, yPos);
		}
	}

}