package
{
   import flash.display.MovieClip;
   
   [Embed(symbol="MapLoadingScreen",source="MapLoadingScreen.swf")]
   public dynamic class MapLoadingScreen extends MovieClip
   {
       
      
      public var difficulty_indicators:MovieClip;
      
      public var mapNameContainer:MovieClip;
      
      public var bgGroup:MovieClip;
      
      public function MapLoadingScreen()
      {
         super();
      }
   }
}
