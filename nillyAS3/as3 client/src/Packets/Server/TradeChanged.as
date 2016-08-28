package Packets.Server
{
   import flash.utils.IDataInput;
   
   public class TradeChanged extends ServerPacket
   {
       
      
      public var offer_:Vector.<Boolean>;
      
      public function TradeChanged(param1:uint, param2:Function)
      {
         this.offer_ = new Vector.<Boolean>();
         super(param1,param2);
      }
      
      override public function parseFromInput(param1:IDataInput) : void
      {
         var _loc3_:int = 0;
         this.offer_.length = 0;
         var _loc2_:int = param1.readShort();
         while(_loc3_ < _loc2_)
         {
            this.offer_.push(param1.readBoolean());
            _loc3_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("TRADECHANGED","offer_");
      }
   }
}
