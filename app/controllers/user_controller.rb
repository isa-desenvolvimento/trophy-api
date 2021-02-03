class UserController < ApplicationController

    require 'digest/sha1'

    def sum_coins
        @users = User.sum_coins(params[:user_id])
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


    def create
        puts params
        @users = User.new(user_params)
        if @users.save
            render json: {status: 'SUCCESS', message:'Saved user', data:@users},status: :ok
        else
            render json: {status: 'ERROR', message:'User not saved', data:@users.errors},status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {status: 'SUCCESS', message:'Deleted users', data:@user},status: :ok
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {status: 'SUCCESS', message:'Updated users', data:@user},status: :ok
        else
            render json: {status: 'ERROR', message:'Users not update', data:@user.erros},status: :unprocessable_entity
        end
    end


    private
    def user_params
        enc = Digest::SHA1.hexdigest(params["pass"])
        puts params["pass"] = enc
        params.permit(:name, :email, :pass)
    end

   

end
