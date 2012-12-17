package utils
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.ColorPicker;
	import mx.events.ColorPickerEvent;

	public class MyPicker extends ColorPicker
	{
		public function MyPicker()
		{
			super();
			addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.SPACE)
			{
				//ピッカーが下りてくる処理を書きたい
				trace("hoge");
			}
		}
	}
}