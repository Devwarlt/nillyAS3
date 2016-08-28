package _0rQ_
{
   import _0sm._bK_;
   
   public class AppEngineRequestStats
   {
       
      
      private const _1av:Object = {};
      
      [Inject]
      public var _M_b:_bK_;
      
      public function AppEngineRequestStats()
      {
         super();
      }
      
      public function _0r3(param1:String, param2:Boolean, param3:int) : void
      {
         var _loc4_:StatsWatch = this._1av[param1] = this._1av[param1] || new StatsWatch(param1);
         _loc4_.addResponse(param2,param3);
         this._M_b.dispatch(_loc4_);
      }
   }
}

import _1cV_._g9;

class StatsWatch extends _g9
{
   
   private static const STATS_PATTERN:String = "[APPENGINE STATS] [0xFFEE00:{/x={MEAN}ms, ok={OK}/{COUNT}} {NAME}]";
   
   private static const MEAN:String = "{MEAN}";
   
   private static const COUNT:String = "{COUNT}";
   
   private static const OK:String = "{OK}";
   
   private static const NAME:String = "{NAME}";
    
   
   private var count:int;
   
   private var time:int;
   
   private var mean:int;
   
   private var ok:int;
   
   function StatsWatch(param1:String)
   {
      super(param1,"");
      this.count = 0;
      this.ok = 0;
      this.time = 0;
   }
   
   public function addResponse(param1:Boolean, param2:int) : void
   {
      param1 && ++this.ok;
      this.time = this.time + param2;
      this.mean = this.time / ++this.count;
      data = this.report();
   }
   
   private function report() : String
   {
      return STATS_PATTERN.replace(MEAN,this.mean).replace(COUNT,this.count).replace(OK,this.ok).replace(NAME,name);
   }
}
