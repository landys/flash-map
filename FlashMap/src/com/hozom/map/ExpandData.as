package com.hozom.map
{
	public class ExpandData
	{
		[Bindable]
		public var fromX:int;
		[Bindable]
		public var fromY:int;
		[Bindable]
		public var toX:int;
		[Bindable]
		public var toY:int;
		[Bindable]
		public var fromW:int;
		[Bindable]
		public var fromH:int;
		[Bindable]
		public var toW:int;
		[Bindable]
		public var toH:int;
			
		public function ExpandData(fromX:int=0, fromY:int=0, toX:int=0, toY:int=0, fromW:int=0, fromH:int=0, toW:int=0, toH:int=0)
		{
			assignData(fromX, fromY, toX, toY, fromW, fromH, toW, toH);
		}

		public function assignData(fromX:int, fromY:int, toX:int, toY:int, fromW:int, fromH:int, toW:int, toH:int):void
		{
			this.fromX = fromX;
			this.fromY = fromY;
			this.toX = toX;
			this.toY = toY;
			this.fromW = fromW;
			this.fromH = fromH;
			this.toW = toW;
			this.toH = toH;
		}
		
		public function copyData(ed:ExpandData):void
		{
			this.fromX = ed.fromX;
			this.fromY = ed.fromY;
			this.toX = ed.toX;
			this.toY = ed.toY;
			this.fromW = ed.fromW;
			this.fromH = ed.fromH;
			this.toW = ed.toW;
			this.toH = ed.toH;
		}
	}
}