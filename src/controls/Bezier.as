package controls
{
	//いざとなったら、この辺も試す。
	//http://childtv.web.fc2.com/bezier/js/pencil.js
	
    import flash.display.Sprite;
    import flash.events.*;
    import flash.geom.Point;
    
    public class Bezier extends Sprite
    {
		//--------------------------------------------------
		//
		// Valiables
		//
		//--------------------------------------------------
				
		private var start:Point;            // 描画開始地点
        private var controlList:Array;         // コントロールのリスト
        private var anchors:Array;          // アンカーポイントのリスト
        private var cur:Point;              // 現在のマウス地点 そのうちprivateに
        private var prev:Point;             // 直前のコントロールもしくはアンカーポイント
        private var count:int;              // マウスの移動数
        private const WAIT:int = 2;        // マウスの移動数の閾値
        private const DISTANCE:int = 10;    // マウスの移動距離の閾値
        
        public var lineThickness:Number = 1;
        public var lineColor:uint = 0;
        public var lineAlpha:Number = 1;

		//--------------------------------------------------
		//
		// Properties
		//
		//--------------------------------------------------
		
		/**
		 * 
 		 */
 		public function set curx(x:int):void
 		{
 			cur.x = x;
 		}

 		public function set cury(y:int):void
 		{
 			cur.y = y;
 		}
 		
 		
 		/**
 		 * 定数倍の大きさに縮尺されたこの線を返します
 		 */
 		public function getSizedBezier(num:int):Bezier
 		{
 			return this; 			
 		}
  		
		//--------------------------------------------------
		//
		// Constructor
		//
		//--------------------------------------------------
		public function Bezier(x:int, y:int, thickness:Number = 1, color:uint = 0, alpha:Number = 1)
        {
        	// パラメータ初期化
            count = 0;
            start = new Point(x, y);
            cur = start.clone();
            prev = start.clone();;
            controlList = [null];
            anchors = [start];
            
            lineThickness = thickness;
            lineColor = color;
            lineAlpha = alpha;
            
            
            addEventListener("enterFrame", enterFrameHandler);
        }
        
		//--------------------------------------------------
		//
		// Methos
		//
		//--------------------------------------------------
		
		public function mouseMove(x:int, y:int):void
		{
            cur.x = x;
            cur.y = y;
            count++;
			
			if(count == WAIT || count < WAIT && Point.distance(prev, cur) > DISTANCE) {
				//WAIT = 20 回目の呼び出しか、以前のコントロールポイントからの距離がDISTANCE = 20以上であれば
				//新しいコンとロールポイントを追加
				
                // コントロールポイント追加
                prev = cur.clone();
                controlList.push(cur.clone());
                count = WAIT;
            }
            else if(count == WAIT * 2 || Point.distance(prev, cur) > DISTANCE) {
            	//カウントがWAIT*2 = 40であるか、以前のコントロールポイントからの距離がDISTANCE = 20以上であれば
				//新しいアンカーポイントを追加
            	
                // アンカーポイント追加
                prev = cur.clone();
                anchors.push(cur.clone());

                // コントロールポイントの位置を修正
                var p1:Point = Point(anchors[anchors.length - 2]);
                var c:Point = Point(controlList[anchors.length - 1]);
                c.x = c.x * 2 - (p1.x + cur.x) / 2;
                c.y = c.y * 2 - (p1.y + cur.y) / 2;

                count = 0;
            }
		}
		
		public function mouseUp():void
		{
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		public function enterFrameHandler(event:Event):void
		{
			graphics.clear();
			trace("enterFrame");
			if(start) {
				if(controlList.length < 2)
				{
					graphics.beginFill(lineColor);
					graphics.drawCircle(start.x, start.y, lineThickness/2);				
					graphics.endFill();
				}
				// ラインの色・太さを設定
	            graphics.lineStyle(lineThickness, lineColor, lineAlpha);

                // 始点へ移動
                graphics.moveTo(anchors[0].x, anchors[0].y);
    		
                // ベジェ曲線を描画
                for(var i:int = 1; i < anchors.length; i++) {
                    graphics.curveTo(
                        controlList[i].x, 
                        controlList[i].y, 
                        anchors[i].x, 
                        anchors[i].y);
                }

                // 終点へ移動
                graphics.lineTo(cur.x, cur.y);
                
            }		
		}
    }
}