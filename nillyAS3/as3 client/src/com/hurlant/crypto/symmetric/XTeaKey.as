package com.hurlant.crypto.symmetric
{
   import flash.utils.ByteArray;
   import com.hurlant.crypto.prng.Random;
   import com.hurlant.util.Memory;
   
   public class XTeaKey implements ISymmetricKey
   {
       
      
      public const NUM_ROUNDS:uint = 64;
      
      private var k:Array;
      
      public function XTeaKey(param1:ByteArray)
      {
         super();
         param1.position = 0;
         this.k = [param1.readUnsignedInt(),param1.readUnsignedInt(),param1.readUnsignedInt(),param1.readUnsignedInt()];
      }
      
      public static function parseKey(param1:String) : XTeaKey
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUnsignedInt(parseInt(param1.substr(0,8),16));
         _loc2_.writeUnsignedInt(parseInt(param1.substr(8,8),16));
         _loc2_.writeUnsignedInt(parseInt(param1.substr(16,8),16));
         _loc2_.writeUnsignedInt(parseInt(param1.substr(24,8),16));
         _loc2_.position = 0;
         return new XTeaKey(_loc2_);
      }
      
      public function getBlockSize() : uint
      {
         return 8;
      }
      
      public function encrypt(param1:ByteArray, param2:uint = 0) : void
      {
         var _loc3_:uint = 0;
         var _loc6_:uint = 0;
         param1.position = param2;
         var _loc4_:uint = param1.readUnsignedInt();
         var _loc5_:uint = param1.readUnsignedInt();
         var _loc7_:uint = 2654435769;
         _loc3_ = 0;
         while(_loc3_ < this.NUM_ROUNDS)
         {
            _loc4_ = _loc4_ + ((_loc5_ << 4 ^ _loc5_ >> 5) + _loc5_ ^ _loc6_ + this.k[_loc6_ & 3]);
            _loc6_ = _loc6_ + _loc7_;
            _loc5_ = _loc5_ + ((_loc4_ << 4 ^ _loc4_ >> 5) + _loc4_ ^ _loc6_ + this.k[_loc6_ >> 11 & 3]);
            _loc3_++;
         }
         param1.position = param1.position - 8;
         param1.writeUnsignedInt(_loc4_);
         param1.writeUnsignedInt(_loc5_);
      }
      
      public function decrypt(param1:ByteArray, param2:uint = 0) : void
      {
         var _loc3_:uint = 0;
         param1.position = param2;
         var _loc4_:uint = param1.readUnsignedInt();
         var _loc5_:uint = param1.readUnsignedInt();
         var _loc6_:uint = 2654435769;
         var _loc7_:uint = _loc6_ * this.NUM_ROUNDS;
         _loc3_ = 0;
         while(_loc3_ < this.NUM_ROUNDS)
         {
            _loc5_ = _loc5_ - ((_loc4_ << 4 ^ _loc4_ >> 5) + _loc4_ ^ _loc7_ + this.k[_loc7_ >> 11 & 3]);
            _loc7_ = _loc7_ - _loc6_;
            _loc4_ = _loc4_ - ((_loc5_ << 4 ^ _loc5_ >> 5) + _loc5_ ^ _loc7_ + this.k[_loc7_ & 3]);
            _loc3_++;
         }
         param1.position = param1.position - 8;
         param1.writeUnsignedInt(_loc4_);
         param1.writeUnsignedInt(_loc5_);
      }
      
      public function dispose() : void
      {
         var _loc2_:uint = 0;
         var _loc1_:Random = new Random();
         while(_loc2_ < this.k.length)
         {
            this.k[_loc2_] = _loc1_.nextByte();
            delete this.k[_loc2_];
            _loc2_++;
         }
         this.k = null;
         Memory.gc();
      }
      
      public function toString() : String
      {
         return "xtea";
      }
   }
}
