package com.hozom.map
{
	import flash.display.DisplayObject;
	
	public class Floater
	{
		public var long:Number;
		public var lat:Number;
		public var mcX:Number;
		public var mcY:Number;
		public var xOffset:Number;
		public var yOffset:Number;
		public var disObj:DisplayObject;
		public var type:String;
		public var data:Object;
		public var ed:ExpandData;
		public var isDeleted:Boolean;
		
		public function Floater(long:Number=0, lat:Number=0, mcX:Number=0, mcY:Number=0, 
			xOffset:Number=0, yOffset:Number=0, disObj:DisplayObject=null)
		{
			this.long = long;
			this.lat = lat;
			this.mcX = mcX;
			this.mcY = mcY;
			this.xOffset = xOffset;
			this.yOffset = yOffset;
			this.disObj = disObj;
			
			this.isDeleted = false;
			this.type = null;
			this.data = null;
			this.ed = null;
		}
	}
}