class UsersTrophyController < ApplicationController

    def index
      @trophies = UserTrophy.all;
        render json: {status: 'SUCCESS', message:'Trophies loaded', data:@trophies},status: :ok
      end
    
      def show
        @trophies = UserTrophy.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded trophy', data:@trophies},status: :ok
      end
    
      def create
        puts params
        @trophies = UserTrophy.new(user_params)
        if @trophies.save
          render json: {status: 'SUCCESS', message:'Saved trophy', data:@trophies},status: :ok
        else
          render json: {status: 'ERROR', message:'UserTrophy not saved', data:@trophies.errors},status: :unprocessable_entity
        end
      end
    
      def destroy
        @trophies = UserTrophy.find(params[:id])
        @trophies.destroy
        render json: {status: 'SUCCESS', message:'Deleted trophies', data:@trophies},status: :ok
      end
    
      def update
        @trophies = UserTrophy.find(params[:id])
        if @trophies.update(user_params)
          render json: {status: 'SUCCESS', message:'Updated trophies', data:@trophies},status: :ok
        else
          render json: {status: 'ERROR', message:'Trophies not update', data:@trophies.erros},status: :unprocessable_entity
        end
      end
    
      private
      def user_params
        params.permit(:user_id, :trophy_id)
      end

      
end
