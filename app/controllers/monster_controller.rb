class MonsterController < ApplicationController

  def index
    @monster = Monster.order('name ASC');
    render json: {status: 'SUCCESS', message:'Monsters loaded', data:@monster},status: :ok
  end
  
  def show
    @monster = Monster.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded article', data:@monster},status: :ok
  end


  # before_action :authenticate_user!
  def create
    Monster.transaction do
      @monster = Monster.new(params.permit(:name))
      if @monster.save
        render json: {status: 'SUCCESS', message:'Saved monster', data:@monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not saved', data:@monster.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end


  def destroy
    Monster.transaction do
      @monster = Monster.find(params[:id])
      if @monster.destroy
        render json: {status: 'SUCCESS', message:'Deleted monster', data:@monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not deleted', data:@monster.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end


  def update
    Monster.transaction do
      @monster = Monster.find(params[:id])
      if @monster.update(monster_params)
        render json: {status: 'SUCCESS', message:'Updated monster', data:@monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monsters not update', data:@monster.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end


  private
  def monster_params
    params.permit(:name)
  end
      
end
