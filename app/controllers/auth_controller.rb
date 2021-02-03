class AuthController < ApplicationController

    require 'digest/sha1'

    def auth
        enc = Digest::SHA1.hexdigest(params["pass"])

        @user = User.where("email=? and pass=?", params[:email], enc)
        if @user.present?
            render json: {status: 'SUCCESS', message:'User Auth', data:@user},status: :ok
        else
            render json: {status: 'ERROR', message:'not authenticator', data:@user},status: :ok
        end
    end

end
