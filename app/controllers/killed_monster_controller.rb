class KilledMonsterController < ApplicationController


  #somatória de monstros mortos por um user
  def sum_monsters
    @killedMonster = KilledMonster.sum_monsters(params[:killed_monster_id])
    render json: {status: 'SUCCESS', message:'Killed Monsters by user', data:@killedMonster},status: :ok
  end



  def index
    @killedMonster = KilledMonster.all;
    render json: {status: 'SUCCESS', message:'Killed Monsters loaded', data:@killedMonster},status: :ok
  end
  
  def show
    @killedMonster = KilledMonster.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded Killed Monsters', data:@killedMonster},status: :ok
  end
  
  def create
    puts params
    @killedMonster = KilledMonster.new(killed_monster_params)
    if @killedMonster.save
      render json: {status: 'SUCCESS', message:'Saved killed monsters', data:@killedMonster},status: :ok
    else
      render json: {status: 'ERROR', message:'Killed monsters not saved', data:@killedMonster.errors},status: :unprocessable_entity
    end
  end
  
  def destroy
    @killedMonster = KilledMonster.find(params[:id])
    @killedMonster.destroy
    render json: {status: 'SUCCESS', message:'Deleted killed monsters', data:@killedMonster},status: :ok
  end

  def update
    @killedMonster = KilledMonster.find(params[:id])
    if @killedMonster.update(killed_monster_params)
      render json: {status: 'SUCCESS', message:'Updated killed monsters', data:@killedMonster},status: :ok
    else
      render json: {status: 'ERROR', message:'Collected coins not update', data:@killedMonster.erros},status: :unprocessable_entity
    end
  end

  private
  def killed_monster_params
    params.permit(:user_id, :monster_id)
  end
end
