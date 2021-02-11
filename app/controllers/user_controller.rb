class UserController < ApplicationController


    def rank
        puts params
        @users = User.rank(params[:user_id])
        if @users != false
            render json: {status: 'SUCCESS', message:'User rank', data:@users},status: :ok
        else
            render json: {status: 'ERROR', message:'Rank not found', data:@users},status: :unprocessable_entity
        end
    end

    def info_coins
        @users = CollectedCoin.info_coins(params[:user_id])
        render json: {status: 'SUCCESS', message:'User total coins', data:@users},status: :ok
    end

    def info_monsters
        @users = User.info_monsters(params[:user_id])
        render json: {status: 'SUCCESS', message:'User total coins', data:@users},status: :ok
    end

    def info_deaths
        @users = User.info_deaths(params[:user_id])
        render json: {status: 'SUCCESS', message:'User total coins', data:@users},status: :ok
    end


    def index
        @users = User.order('name ASC');
        render json: {status: 'SUCCESS', message:'Users loaded', data:@users},status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded user', data:@user},status: :ok
    end

    # before_action :authenticate_user!
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {status: 'SUCCESS', message:'Deleted users', data:@user},status: :ok
    end

end
