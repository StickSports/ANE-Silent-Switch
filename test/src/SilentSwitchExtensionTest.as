package
{
	import com.sticksports.nativeExtensions.SilentSwitch;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	
	[SWF(width='320', height='480', frameRate='30', backgroundColor='#000000')]
	
	public class SilentSwitchExtensionTest extends Sprite
	{
		private var direction : int = 1;
		private var shape : Shape;
		private var feedback : TextField;
		
		private var buttonFormat : TextFormat;
		
		public function SilentSwitchExtensionTest()
		{
			shape = new Shape();
			shape.graphics.beginFill( 0x666666 );
			shape.graphics.drawCircle( 0, 0, 100 );
			shape.graphics.endFill();
			shape.x = 0;
			shape.y = 240;
			addChild( shape );
			
			feedback = new TextField();
			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			format.size = 16;
			format.color = 0xFFFFFF;
			feedback.defaultTextFormat = format;
			feedback.width = 320;
			feedback.height = 260;
			feedback.x = 10;
			feedback.y = 210;
			feedback.multiline = true;
			feedback.wordWrap = true;
			feedback.text = "Hello";
			addChild( feedback );
			
			addEventListener( Event.ENTER_FRAME, animate );

			createButtons();
		}
		
		private function createButtons() : void
		{
			var tf : TextField = createButton( "playSound1" );
			tf.x = 10;
			tf.y = 10;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, playSound1 );
			addChild( tf );
			
			tf = createButton( "playSound2" );
			tf.x = 170;
			tf.y = 10;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, playSound2 );
			addChild( tf );
			
			tf = createButton( "silentSwitch" );
			tf.x = 10;
			tf.y = 50;
			tf.addEventListener( MouseEvent.MOUSE_DOWN, applySilentSwitch );
			addChild( tf );
		}
		
		private function createButton( label : String ) : TextField
		{
			if( !buttonFormat )
			{
				buttonFormat = new TextFormat();
				buttonFormat.font = "_sans";
				buttonFormat.size = 14;
				buttonFormat.bold = true;
				buttonFormat.color = 0xFFFFFF;
				buttonFormat.align = TextFormatAlign.CENTER;
			}
			
			var textField : TextField = new TextField();
			textField.defaultTextFormat = buttonFormat;
			textField.width = 140;
			textField.height = 30;
			textField.text = label;
			textField.backgroundColor = 0xCC0000;
			textField.background = true;
			textField.selectable = false;
			textField.multiline = false;
			textField.wordWrap = false;
			return textField;
		}
		
		private function playSound1( event : MouseEvent ) : void
		{
			var snd : Sound = new Sound1();
			snd.play( 0, 10000 );
			feedback.text = "var snd : Sound = new Sound1();\nsnd.play( 0, 10000 );";
		}
		
		private function playSound2( event : MouseEvent ) : void
		{
			var snd : Sound = new Sound2();
			snd.play( 0, 10000 );
			feedback.text = "var snd : Sound = new Sound2();\nsnd.play( 0, 10000 );";
		}

		private function applySilentSwitch( event : MouseEvent ) : void
		{
			SilentSwitch.apply();
			feedback.text = "SilentSwitch.apply();";
		}
		
		private function animate( event : Event ) : void
		{
			shape.x += direction;
			if( shape.x <= 0 )
			{
				direction = 1;
			}
			if( shape.x > 320 )
			{
				direction = -1;
			}
		}
	}
}