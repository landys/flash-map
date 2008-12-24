package com.hozom.map
{
	import flx.events.FlashInterfaceEvent;
	import flx.external.FlashInterface;
	
	import mx.collections.ArrayCollection;
	
	public class HozomMapUtil
	{
		public static const AMMAP_ID:String = "ammap";
		
		/*public static var mouseX:Number = 0;
		
		public static var mouseY:Number = 0;
		
		public static var mouseXp:Number = 0;
		
		public static var mouseYp:Number = 0;
		
		public static var long:Number = 0;
		
		public static var lat:Number = 0;

		public static var zoomX:Number = 0;
		
		public static var zoomY:Number = 0;*/
		
		public static var zoom:Number = 1;
		
		public static var coordx:Number = 0;
		
		public static var coordy:Number = 0;
		
		// all display objects floating on top of the map will be stored here
		public static var floaters : ArrayCollection = new ArrayCollection();
		
		public static function initListener():void
		{
			FlashInterface.addEventListener("mouseMove", ammpMouseMove);
		}
		
		private static function ammpMouseMove(event:FlashInterfaceEvent):void
		{
			var obj:Object = event.data;
			var newZoom:Number = obj.zoom;
			var newCoordx:Number = obj.coordx;
			var newCoordy:Number = obj.coordy;
			
			if (newZoom != zoom || newCoordx != coordx || newCoordy != coordy)
			{
				zoom = newZoom;
				coordx = newCoordx;
				coordy = newCoordy;
				adjustFloaters();
			}
			/*mouseX = obj.x;
			mouseY = obj.y;
			mouseXp = obj.xp;
			mouseYp = obj.yp;
			long = obj.long;
			lat = obj.lat;			
			zoomX = obj.zoomx;
			zoomY = obj.zoomy;*/
		}
		
		private static function adjustFloaters():void
		{
			for (var i:int=0; i<floaters.length; ++i)
			{
				var floater:Floater = Floater(floaters.getItemAt(i));
				floater.disObj.x = adjustX(floater.mcX);
				floater.disObj.y = adjustY(floater.mcY);
			}
		}
		
		public static function adjustX(x:Number):int
		{
			return Math.round(x * zoom / 100  + coordx);
		}
		
		public static function adjustY(y:Number):int
		{
			return Math.round(y * zoom / 100  + coordy);
		}
		
		public static function getMcXByLong(long:Number):Number
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getMcXByLong", long);
			return Number(obj.result);
		}
		
		public static function getMcYByLat(lat:Number):Number
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getMcYByLat", lat);
			return Number(obj.result);
		}
			
		public static function getXByLong(long:Number):int
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getXByLong", long);
			return Math.round(Number(obj.result));
		}
		
		public static function getYByLat(lat:Number):int
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getYByLat", lat);
			return Math.round(Number(obj.result));
		}
		
		
	}
}