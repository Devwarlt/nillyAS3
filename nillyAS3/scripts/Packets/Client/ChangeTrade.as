package Packets.Client
{
   import flash.utils.IDataOutput;
   
   public class ChangeTrade extends ClientPacket
   {
       
      
      public var offer_:Vector.<Boolean>;
      
      public function ChangeTrade(param1:uint, param2:Function)
      {
         this.offer_ = new Vector.<Boolean>();
         super(param1,param2);
      }
      
      override public function writeToOutput(param1:IDataOutput) : void
      {
         var _loc2_:int = 0;
         param1.writeShort(this.offer_.length);
         while(_loc2_ < this.offer_.length)
         {
            param1.writeBoolean(this.offer_[_loc2_]);
            _loc2_++;
         }
      }
      
      override public function toString() : String
      {
         return formatToString("CHANGETRADE","offer_");
      }
   }
}
