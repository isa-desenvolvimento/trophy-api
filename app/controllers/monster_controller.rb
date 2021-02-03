class MonsterController < ApplicationController

    def index
      @monster = Monster.order('name ASC');
        render json: {status: 'SUCCESS', message:'Monsters loaded', data:@monster},status: :ok
      end
    
      def show
        @monster = Monster.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded article', data:@monster},status: :ok
      end
    
      def create
        @monster = Monster.new(params.permit(:name))
        if @monster.save
          render json: {status: 'SUCCESS', message:'Saved monster', data:@monster},status: :ok
        else
          render json: {status: 'ERROR', message:'Monster not saved', data:@monster.errors},status: :unprocessable_entity
        end
      end
    
      def destroy
        @monster = Monster.find(params[:id])
        @monster.destroy
        render json: {status: 'SUCCESS', message:'Deleted monster', data:@monster},status: :ok
      end
    
      def update
        @monster = Monster.find(params[:id])
        if monster.update(monster_params)
          render json: {status: 'SUCCESS', message:'Updated monster', data:@monster},status: :ok
        else
          render json: {status: 'ERROR', message:'Monsters not update', data:@monster.erros},status: :unprocessable_entity
        end
      end
    
      private
      def monster_params
        params.permit(:name)
      end

      
end
