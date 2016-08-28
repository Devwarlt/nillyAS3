package com.hurlant.crypto.symmetric
{
   import flash.utils.ByteArray;
   
   public class CFB8Mode extends IVMode implements IMode
   {
       
      
      public function CFB8Mode(param1:ISymmetricKey, param2:IPad = null)
      {
         super(param1,null);
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         var _loc2_:uint = 0;
         var _loc5_:uint = 0;
         var _loc3_:ByteArray = getIV4e();
         var _loc4_:ByteArray = new ByteArray();
         while(_loc5_ < param1.length)
         {
            _loc4_.position = 0;
            _loc4_.writeBytes(_loc3_);
            key.encrypt(_loc3_);
            param1[_loc5_] = param1[_loc5_] ^ _loc3_[0];
            _loc2_ = 0;
            while(_loc2_ < blockSize - 1)
            {
               _loc3_[_loc2_] = _loc4_[_loc2_ + 1];
               _loc2_++;
            }
            _loc3_[blockSize - 1] = param1[_loc5_];
            _loc5_++;
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         var _loc4_:ByteArray = getIV4d();
         var _loc5_:ByteArray = new ByteArray();
         while(_loc6_ < param1.length)
         {
            _loc2_ = param1[_loc6_];
            _loc5_.position = 0;
            _loc5_.writeBytes(_loc4_);
            key.encrypt(_loc4_);
            param1[_loc6_] = param1[_loc6_] ^ _loc4_[0];
            _loc3_ = 0;
            while(_loc3_ < blockSize - 1)
            {
               _loc4_[_loc3_] = _loc5_[_loc3_ + 1];
               _loc3_++;
            }
            _loc4_[blockSize - 1] = _loc2_;
            _loc6_++;
         }
      }
      
      public function toString() : String
      {
         return key.toString() + "-cfb8";
      }
   }
}
