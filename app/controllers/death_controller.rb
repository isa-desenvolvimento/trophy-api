class DeathController < ApplicationController

  def index
    @death = Death.all;
    render json: {status: 'SUCCESS', message:'Deaths loaded', data:@death},status: :ok
  end

  def show
    @death = Death.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded deaths', data:@death},status: :ok
  end

  # before_action :authenticate_user!
  def create
    Death.transaction do
      @death = Death.new(params.permit(:name))
      if @death.save && @death.save_info_death(death_params)
        render json: {status: 'SUCCESS', message:'Saved death', data:@death},status: :ok
      else
        render json: {status: 'ERROR', message:'Death not saved', data:@death.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end

  def destroy
    Death.transaction do
    @death = Death.find(params[:id])
      if @death.destroy
        render json: {status: 'SUCCESS', message:'Deleted death', data:@death},status: :ok
      else
        render json: {status: 'ERROR', message:'Death not deleted', data:@death.errors},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end

  def update
    Death.transaction do
      @death = Death.find(params[:id])
      if @death.update(death_params)
        render json: {status: 'SUCCESS', message:'Updated death', data:@death},status: :ok
      else
        render json: {status: 'ERROR', message:'Deaths not update', data:@death.erros},status: :unprocessable_entity
        raise ActiveRecord::Rollback, "Erro"
      end
    end
  end

  private
  def death_params
    params.permit(:user_id, :time_reg)
  end
    
end
