package _0ib
{
   import flash.events.EventDispatcher;
   import _2F_.Console;
   import _2F_._0__X_;
   
   public class _05E_ extends EventDispatcher
   {
       
      
      protected var console:Console;
      
      protected var config:_0__X_;
      
      public function _05E_(param1:Console)
      {
         super();
         this.console = param1;
         this.config = this.console.config;
      }
      
      protected function get remoter() : _0B_2
      {
         return this.console.remoter;
      }
      
      protected function report(param1:* = "", param2:int = 0, param3:Boolean = true, param4:String = null) : void
      {
         this.console.report(param1,param2,param3,param4);
      }
   }
}
