package com.company.assembleegameclient.game
{
   import _7m._dp;
   
   public class _1jV_
   {
       
      
      public var lastClearTime_:int = -1;
      
      public var records_:Vector.<_dp>;
      
      public function _1jV_()
      {
         this.records_ = new Vector.<_dp>();
         super();
      }
      
      public function addRecord(param1:int, param2:Number, param3:Number) : void
      {
         if(this.lastClearTime_ < 0)
         {
            return;
         }
         var _loc4_:int = this._031(param1);
         if(_loc4_ < 1 || _loc4_ > 10)
         {
            return;
         }
         if(this.records_.length == 0)
         {
            this.records_.push(new _dp(param1,param2,param3));
            return;
         }
         var _loc5_:_dp = this.records_[this.records_.length - 1];
         var _loc6_:int = this._031(_loc5_.time_);
         if(_loc4_ != _loc6_)
         {
            this.records_.push(new _dp(param1,param2,param3));
            return;
         }
         var _loc7_:int = this._11q(_loc4_,param1);
         var _loc8_:int = this._11q(_loc4_,_loc5_.time_);
         if(_loc7_ < _loc8_)
         {
            _loc5_.time_ = param1;
            _loc5_.x_ = param2;
            _loc5_.y_ = param3;
            return;
         }
      }
      
      private function _031(param1:int) : int
      {
         return (param1 - this.lastClearTime_ + 50) / 100;
      }
      
      private function _11q(param1:int, param2:int) : int
      {
         return Math.abs(param2 - this.lastClearTime_ - param1 * 100);
      }
      
      public function clear(param1:int) : void
      {
         this.records_.length = 0;
         this.lastClearTime_ = param1;
      }
   }
}
