package com.hozom.map
{
	import flx.events.FlashInterfaceEvent;
	import flx.external.FlashInterface;
	
	import mx.collections.ArrayCollection;
	
	public class HozomMapCaller
	{
		public static const AMMAP_ID:String = "hozomAmmap";
		
		public static var idGen:int = 0;
		
		public var zoom:Number = 1;
		
		public var coordx:Number = 0;
		
		public var coordy:Number = 0;
		
		// all display objects floating on top of the map will be stored here
		private var floaters : ArrayCollection = new ArrayCollection();
		
		private var floaterMap : Object = new Object();
		
		public function HozomMapCaller()
		{
		}
		
		public function initListener():void
		{
			FlashInterface.addEventListener("ammapMouseMove", ammpMouseMove);
		}
		
		public function ammpMouseMove(event:FlashInterfaceEvent):void
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
		}
		
		public function addFloater(floater:Floater):int
		{
			floaters.addItem(floater);
			floaterMap[++idGen] = floater;
			
			return idGen;
		}
		
		public function findFloaterById(id:int):Floater
		{
			return floaterMap[id];
		}
		
		private function adjustFloaters():void
		{
			for (var i:int=0; i<floaters.length; ++i)
			{
				var floater:Floater = Floater(floaters.getItemAt(i));
				floater.disObj.x = Math.round(adjustX(floater.mcX) + floater.xOffset);
				floater.disObj.y = Math.round(adjustY(floater.mcY) + floater.yOffset);
				
				if (floater.data != null)
				{
					var obj:Object = floater.data[HozomMapUtil.FLOATER_ONLINE_KEY];
					var f:Floater = null;
					if (obj != null)
					{
						f = Floater(obj);
						f.disObj.x = floater.disObj.x + f.xOffset;
						f.disObj.y = floater.disObj.y + f.yOffset;
					}
					
					obj = floater.data[HozomMapUtil.FLOATER_POP_KEY];
					if (obj != null)
					{
						f = Floater(obj);
						f.disObj.x = floater.disObj.x + f.xOffset;
						f.disObj.y = floater.disObj.y + f.yOffset;
					}
				}
			}
		}
		
		public function adjustX(x:Number):Number
		{
			return x * zoom / 100  + coordx;
		}
		
		public function adjustY(y:Number):Number
		{
			return y * zoom / 100  + coordy;
		}
		
		public function getMcXByLong(long:Number):Number
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getMcXByLong", long);
			return Number(obj.result);
		}
		
		public function getMcYByLat(lat:Number):Number
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getMcYByLat", lat);
			return Number(obj.result);
		}
			
		public function getXByLong(long:Number):int
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getXByLong", long);
			return Math.round(Number(obj.result));
		}
		
		public function getYByLat(lat:Number):int
		{
			var obj:Object = FlashInterface.call(AMMAP_ID + ".getYByLat", lat);
			return Math.round(Number(obj.result));
		}
	}
}