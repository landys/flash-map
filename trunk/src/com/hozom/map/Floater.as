package com.hozom.map
{
	import flash.display.DisplayObject;
	
	public class Floater
	{
		public var long:Number;
		public var lat:Number;
		public var mcX:Number;
		public var mcY:Number;
		public var xOffset:int;
		public var yOffset:int;
		public var disObj:DisplayObject;
		
		//public function Floater()
		//{
		//}
		
		public function Floater(long:Number=0, lat:Number=0, mcX:Number=0, mcY:Number=0, 
			xOffset:int=0, yOffset:int=0, disObj:DisplayObject=null)
		{
			this.long = long;
			this.lat = lat;
			this.mcX = mcX;
			this.mcY = mcY;
			this.xOffset = xOffset;
			this.yOffset = yOffset;
			this.disObj = disObj;
		}
	}
}