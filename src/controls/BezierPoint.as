package controls
{
	import flash.display.Sprite;
	
	internal class BezierPoint extends Sprite
	{
		private const COLOR:int = 0x000000;
	    private const RADIUS:int = 3;

	    public function BezierPoint()
	    {
	        graphics.beginFill(COLOR);
	        graphics.drawCircle(0, 0, RADIUS);
	        graphics.endFill();
	
	        buttonMode = true;
	
	        addEventListener("mouseDown", function(event:*):void{startDrag()});
	        addEventListener("mouseUp", function(event:*):void{stopDrag()});
    	}
 	}
}