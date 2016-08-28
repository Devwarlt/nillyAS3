package _1uq
{
   import flash.utils.describeType;
   
   public class _U_n
   {
       
      
      private var _06w:String;
      
      public function _U_n(param1:*)
      {
         super();
         this._06w = this._mW_(param1);
      }
      
      public function getString() : String
      {
         return this._06w;
      }
      
      private function _mW_(param1:*) : String
      {
         if(param1 is String)
         {
            return this._0z4(param1 as String);
         }
         if(param1 is Number)
         {
            return !!isFinite(param1 as Number)?param1.toString():"null";
         }
         if(param1 is Boolean)
         {
            return !!param1?"true":"false";
         }
         if(param1 is Array)
         {
            return this._1O_u(param1 as Array);
         }
         if(param1 is Object && param1 != null)
         {
            return this._1N_p(param1);
         }
         return "null";
      }
      
      private function _0z4(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc7_:int = 0;
         var _loc5_:* = "";
         var _loc6_:Number = param1.length;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = param1.charAt(_loc7_);
            switch(_loc2_)
            {
               case "\"":
                  _loc5_ = _loc5_ + "\\\"";
                  break;
               case "\\":
                  _loc5_ = _loc5_ + "\\\\";
                  break;
               case "\b":
                  _loc5_ = _loc5_ + "\\b";
                  break;
               case "\f":
                  _loc5_ = _loc5_ + "\\f";
                  break;
               case "\n":
                  _loc5_ = _loc5_ + "\\n";
                  break;
               case "\r":
                  _loc5_ = _loc5_ + "\\r";
                  break;
               case "\t":
                  _loc5_ = _loc5_ + "\\t";
                  break;
               default:
                  if(_loc2_ < " ")
                  {
                     _loc3_ = _loc2_.charCodeAt(0).toString(16);
                     _loc4_ = _loc3_.length == 2?"00":"000";
                     _loc5_ = _loc5_ + ("\\u" + _loc4_ + _loc3_);
                  }
                  else
                  {
                     _loc5_ = _loc5_ + _loc2_;
                  }
            }
            _loc7_++;
         }
         return "\"" + _loc5_ + "\"";
      }
      
      private function _1O_u(param1:Array) : String
      {
         var _loc3_:int = 0;
         var _loc2_:* = "";
         while(_loc3_ < param1.length)
         {
            if(_loc2_.length > 0)
            {
               _loc2_ = _loc2_ + ",";
            }
            _loc2_ = _loc2_ + this._mW_(param1[_loc3_]);
            _loc3_++;
         }
         return "[" + _loc2_ + "]";
      }
      
      private function _1N_p(param1:Object) : String
      {
         var value:Object = null;
         var key:String = null;
         var v:XML = null;
         var o:Object = param1;
         var s:String = "";
         var classInfo:XML = describeType(o);
         if(classInfo.@name.toString() == "Object")
         {
            for(key in o)
            {
               value = o[key];
               if(!(value is Function))
               {
                  if(s.length > 0)
                  {
                     s = s + ",";
                  }
                  s = s + (this._0z4(key) + ":" + this._mW_(value));
               }
            }
         }
         else
         {
            for each(v in classInfo..*.(name() == "variable" || name() == "accessor"))
            {
               if(s.length > 0)
               {
                  s = s + ",";
               }
               s = s + (this._0z4(v.@name.toString()) + ":" + this._mW_(o[v.@name]));
            }
         }
         return "{" + s + "}";
      }
   }
}
