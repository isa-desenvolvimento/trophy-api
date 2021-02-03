class DeathController < ApplicationController


  #somatória de mortes de um user
  def sum_deaths
    @death = Death.sum_deaths(params[:death_id])
    render json: {status: 'SUCCESS', message:'Deaths by user', data:@death},status: :ok
  end


  def index
    @death = Death.all;
    render json: {status: 'SUCCESS', message:'Deaths loaded', data:@death},status: :ok
  end

  def show
    @death = Death.find(params[:id])
    render json: {status: 'SUCCESS', message:'Loaded deaths', data:@death},status: :ok
  end

  def create
    @death = Death.new(params.permit(:name))
    if @death.save
      render json: {status: 'SUCCESS', message:'Saved death', data:@death},status: :ok
    else
      render json: {status: 'ERROR', message:'Death not saved', data:@death.errors},status: :unprocessable_entity
    end
  end

  def destroy
    @death = Death.find(params[:id])
    @death.destroy
    render json: {status: 'SUCCESS', message:'Deleted death', data:@death},status: :ok
  end

  def update
    @death = Death.find(params[:id])
    if @death.update(death_params)
      render json: {status: 'SUCCESS', message:'Updated death', data:@death},status: :ok
    else
      render json: {status: 'ERROR', message:'Deaths not update', data:@death.erros},status: :unprocessable_entity
    end
  end

  private
  def death_params
    params.permit(:user_id, :time_reg)
  end
    
end
