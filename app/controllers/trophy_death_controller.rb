class TrophyDeathController < ApplicationController



    def index
        @trophys = TrophyDeath.order('name ASC');
        render json: {status: 'SUCCESS', message:'TrophyDeaths loaded', data:@trophys},status: :ok
    end

    def show
        @trophys = TrophyDeath.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded trophy', data:@trophys},status: :ok
    end

    
    # before_action :authenticate_user!
    def create
        TrophyDeath.transaction  do
            @trophys = TrophyDeath.new(params.permit(:name))
            if @trophys.save
                render json: {status: 'SUCCESS', message:'Saved trophy', data:@trophys},status: :ok
            else
                render json: {status: 'ERROR', message:'TrophyDeath not saved', data:@trophys.errors},status: :unprocessable_entity
                raise ActiveRecord::Rollback, "Erro"
            end
        end
    end

    def destroy
        TrophyDeath.transaction do
            @trophys = TrophyDeath.find(params[:id])
            if @trophys.destroy
                render json: {status: 'SUCCESS', message:'Deleted trophys', data:@trophys},status: :ok
            else
                render json: {status: 'ERROR', message:'TrophyDeath not deleted', data:@trophys.errors},status: :unprocessable_entity
                raise ActiveRecord::Rollback, "Erro"
            end
        end
    end

    def update
        TrophyDeath.transaction do
            trophys = TrophyDeath.find(params[:id])
            if @trophys.update(trophy_params)
                render json: {status: 'SUCCESS', message:'Updated trophys', data:@trophys},status: :ok
            else
                render json: {status: 'ERROR', message:'TrophyDeaths not update', data:@trophys.erros},status: :unprocessable_entity
                raise ActiveRecord::Rollback, "Erro"
            end
        end
    end

    private
    def trophy_params
        params.permit(:name)
    end

    
end
