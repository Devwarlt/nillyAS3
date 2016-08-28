package com.company.assembleegameclient.util.offer
{
   public class Offers
   {
      
      private static const BEST_DEAL:String = "(Best deal)";
      
      private static const MOST_POPULAR:String = "(Most popular)";
       
      
      public var tok:String;
      
      public var exp:String;
      
      public var offerList:Vector.<com.company.assembleegameclient.util.offer.Offer>;
      
      public function Offers(param1:XML)
      {
         super();
         this.tok = param1.Tok;
         this.exp = param1.Exp;
         this.makeOffers(param1);
      }
      
      private function makeOffers(param1:XML) : void
      {
         this.makeOfferList(param1);
         this.sortOfferList();
         this.defineBonuses();
         this.defineMostPopularTagline();
         this.defineBestDealTagline();
      }
      
      private function makeOfferList(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.offerList = new Vector.<com.company.assembleegameclient.util.offer.Offer>(0);
         for each(_loc2_ in param1.Offer)
         {
            this.offerList.push(this.makeOffer(_loc2_));
         }
      }
      
      private function makeOffer(param1:XML) : com.company.assembleegameclient.util.offer.Offer
      {
         var _loc2_:String = param1.Id;
         var _loc3_:Number = Number(param1.Price);
         var _loc4_:int = int(param1.RealmGold);
         var _loc5_:String = param1.CheckoutJWT;
         var _loc6_:String = param1.Data;
         var _loc7_:String = !!param1.hasOwnProperty("Currency")?param1.Currency:null;
         return new com.company.assembleegameclient.util.offer.Offer(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      private function sortOfferList() : void
      {
         this.offerList.sort(this.sortOffers);
      }
      
      private function defineBonuses() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.offerList.length == 0)
         {
            return;
         }
         var _loc5_:int = this.offerList[0].realmGold_;
         var _loc6_:int = this.offerList[0].price_;
         var _loc7_:Number = _loc5_ / _loc6_;
         var _loc8_:int = 1;
         while(_loc8_ < this.offerList.length)
         {
            _loc1_ = this.offerList[_loc8_].realmGold_;
            _loc2_ = this.offerList[_loc8_].price_;
            _loc3_ = _loc2_ * _loc7_;
            _loc4_ = _loc1_ - _loc3_;
            this.offerList[_loc8_].bonus = _loc4_ / _loc2_;
            _loc8_++;
         }
      }
      
      private function sortOffers(param1:com.company.assembleegameclient.util.offer.Offer, param2:com.company.assembleegameclient.util.offer.Offer) : int
      {
         return param1.price_ - param2.price_;
      }
      
      private function defineMostPopularTagline() : void
      {
         var _loc1_:com.company.assembleegameclient.util.offer.Offer = null;
         for each(_loc1_ in this.offerList)
         {
            if(_loc1_.price_ == 10)
            {
               _loc1_.tagline = MOST_POPULAR;
            }
         }
      }
      
      private function defineBestDealTagline() : void
      {
         this.offerList[this.offerList.length - 1].tagline = BEST_DEAL;
      }
   }
}
