package loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher  {
		public static const LOAD_COMPLETE:String = "load_complete";
		private var xmlLoader:URLLoader;
		private var my_xml:XML;
		
		function XMLLoader()//isUnicode:Boolean)
		{
			xmlLoader = new URLLoader();
			//xmlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			xmlLoader.addEventListener(Event.COMPLETE, onXMLloaded);
			//System.useCodePage = ! isUnicode;
			//xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, onXMLerror);
		}
		
		public function load(url:String):void
		{
			var urlReq:URLRequest = new URLRequest(url);
			xmlLoader.load(urlReq);
		}
	
		private function onXMLloaded(event:Event):void
		{
			try {
				my_xml = new XML(xmlLoader.data);
				dispatchEvent(new Event(LOAD_COMPLETE));
			} catch (err:TypeError) {
				trace(err.message);
			}
		}

		private function onXMLerror(event:Event):void
		{
			
		}
		public function getXML():XML
		{
			return my_xml;
		}
}
}