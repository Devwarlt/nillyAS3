package com.hurlant.crypto.symmetric
{
   import flash.utils.ByteArray;
   
   public class CTRMode extends IVMode implements IMode
   {
       
      
      public function CTRMode(param1:ISymmetricKey, param2:IPad = null)
      {
         super(param1,param2);
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         padding.pad(param1);
         var _loc2_:ByteArray = getIV4e();
         this.core(param1,_loc2_);
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = getIV4d();
         this.core(param1,_loc2_);
         padding.unpad(param1);
      }
      
      private function core(param1:ByteArray, param2:ByteArray) : void
      {
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:ByteArray = new ByteArray();
         _loc4_.writeBytes(param2);
         while(_loc6_ < param1.length)
         {
            _loc5_.position = 0;
            _loc5_.writeBytes(_loc4_);
            key.encrypt(_loc5_);
            _loc3_ = 0;
            while(_loc3_ < blockSize)
            {
               param1[_loc6_ + _loc3_] = param1[_loc6_ + _loc3_] ^ _loc5_[_loc3_];
               _loc3_++;
            }
            _loc3_ = blockSize - 1;
            while(_loc3_ >= 0)
            {
               _loc7_ = _loc4_;
               _loc8_ = _loc3_;
               _loc9_ = _loc7_[_loc8_] + 1;
               _loc7_[_loc8_] = _loc9_;
               if(_loc4_[_loc3_] != 0)
               {
                  break;
               }
               _loc3_--;
            }
            _loc6_ = _loc6_ + blockSize;
         }
      }
      
      public function toString() : String
      {
         return key.toString() + "-ctr";
      }
   }
}
