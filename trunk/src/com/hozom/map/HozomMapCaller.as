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
		
		public function removeFloaterById(id:int):void
		{
			// TODO mark it and its attached deleted.
			var floater:Floater = findFloaterById(id);
			floater.isDeleted = true;
			if (floater.data != null)
			{
				var obj:Object = floater.data[HozomMapUtil.FLOATER_ONLINE_KEY];
				if (obj != null)
				{
					Floater(obj).isDeleted = true;
				}
				
				obj = floater.data[HozomMapUtil.FLOATER_POP_KEY];
				if (obj != null)
				{
					Floater(obj).isDeleted = true;
				}
			}
		}
		
		private function adjustFloaters():void
		{
			for (var i:int=0; i<floaters.length; ++i)
			{
				var floater:Floater = Floater(floaters.getItemAt(i));
				if (floater.isDeleted)
				{
					continue;
				}
				floater.disObj.x = Math.round(adjustX(floater.mcX) + floater.xOffset);
				floater.disObj.y = Math.round(adjustY(floater.mcY) + floater.yOffset);
				
				// no need atm, for no animation after it created.
				//adjustExpandAnimation(floater);
				
				if (floater.data != null)
				{
					var obj:Object = floater.data[HozomMapUtil.FLOATER_ONLINE_KEY];
					if (obj != null)
					{
						adjustAttached(Floater(obj), floater);
					}
					
					obj = floater.data[HozomMapUtil.FLOATER_POP_KEY];
					if (obj != null)
					{
						adjustAttached(Floater(obj), floater);
					}
				}
			}
		}
		
		private function adjustAttached(af:Floater, host:Floater):void
		{
			af.disObj.x = host.disObj.x + af.xOffset;
			af.disObj.y = host.disObj.y + af.yOffset;
			adjustExpandAnimation(af);
		}
		
		private function adjustExpandAnimation(floater:Floater):void
		{
			var ed:ExpandData = floater.ed;
			if (ed != null)
			{
				var x:int = floater.disObj.x;
				var y:int = floater.disObj.y;
				var xft:int = ed.fromX - ed.toX;
				var yft:int = ed.fromY - ed.toY;
				ed.toX = x;
				ed.toY = y;
				ed.fromX = x + xft;
				ed.fromY = y + yft;
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