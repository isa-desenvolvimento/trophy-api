class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    
    def create
      puts "-------------------------------"
      puts sign_up_params
      
      build_resource(sign_up_params)
  
      resource.save
  
      if resource.errors.empty?
        render json: resource
      else
        render json: resource.errors
      end
    end


  end