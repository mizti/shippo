package utils
{
	import controls.Bezier;
	
	import mx.core.UIComponent;
	import flash.display.Sprite;

	public class BezierAdapter extends UIComponent
	{
		public function BezierAdapter(bez:Sprite)
		{
			super();
			this.addChild(bez);
		}
	}
}