class CollectedCoinController < ApplicationController

    def index
        @collectedCoin = CollectedCoin.all;
        render json: {status: 'SUCCESS', message:'Collected Coins loaded', data:@collectedCoin},status: :ok
      end
    
      def show
        @collectedCoin = CollectedCoin.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded Collected Coins', data:@collectedCoin},status: :ok
      end
    

      before_action :authenticate_user!
      
      def create				
        @collectedCoin = CollectedCoin.new(collectedCoin_params)
        if @collectedCoin.save
          render json: {status: 'SUCCESS', message:'Saved collected coin', data:@collectedCoin},status: :ok
        else
          render json: {status: 'ERROR', message:'Collected Coin not saved', data:@collectedCoin.errors},status: :unprocessable_entity
        end
      end
    
      def destroy
        @collectedCoin = CollectedCoin.find(params[:id])
        @collectedCoin.destroy
        render json: {status: 'SUCCESS', message:'Deleted collected coin', data:@collectedCoin},status: :ok
      end
    
      def update
        @collectedCoin = CollectedCoin.find(params[:id])
        if @collectedCoin.update(collectedCoin_params)
          render json: {status: 'SUCCESS', message:'Updated collected coin', data:@collectedCoin},status: :ok
        else
          render json: {status: 'ERROR', message:'Collected coins not update', data:@collectedCoin.erros},status: :unprocessable_entity
        end
      end
    
      private
      def collectedCoin_params
        params.permit(:user_id, :value_coin)
      end
    
      def teste
        puts params
        @collectedCoin = CollectedCoin.find(params[:id])
        puts @collectedCoin
      end
      
end
