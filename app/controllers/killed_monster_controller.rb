class KilledMonsterController < ApplicationController


  def index
    @killedMonster = KilledMonster.all;
    render json: {status: 'SUCCESS', message:'Killed Monsters loaded', data:@killedMonster},status: :ok
  end
  
  def show
    @killedMonster = KilledMonster.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded Killed Monsters', data:@killedMonster},status: :ok
  end
  
  # before_action :authenticate_user!
  def create
    KilledMonster.transaction do
      @killedMonster = KilledMonster.new(killed_monster_params)
      if @killedMonster.save && @killedMonster.save_info_monster(params.permit(:user_id, :monster_id))
        render json: {status: 'SUCCESS', message:'Saved killed monsters', data:@killedMonster},status: :ok
      else
        render json: {status: 'ERROR', message:'Killed monsters not saved', data:@killedMonster.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end
  
  def destroy
    KilledMonster.transaction do
      @killedMonster = KilledMonster.find(params[:id])
      if @killedMonster.destroy
        render json: {status: 'SUCCESS', message:'Deleted killed monsters', data:@killedMonster},status: :ok
      else        
        render json: {status: 'ERROR', message:'Collected coins not update', data:@killedMonster.erros},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end

  def update
    KilledMonster.transaction do
      @killedMonster = KilledMonster.find(params[:id])
      if @killedMonster.update(killed_monster_params)
        render json: {status: 'SUCCESS', message:'Updated killed monsters', data:@killedMonster},status: :ok
      else
        render json: {status: 'ERROR', message:'Collected coins not update', data:@killedMonster.erros},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end

  private
  def killed_monster_params
    params.permit(:user_id, :monster_id)
  end
end
