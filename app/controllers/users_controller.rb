class UsersController < ApplicationController

	def index 
	@user= User2.all	
  	 	respond_to do |f|
		  	f.json{}
		    f.html{}
 		end
	end
	def show
    u_id=params[:id] 
    @user= User2.where(id: u_id).first
	end

	def create
		u= User2.new({
			nickname: params[:nickname],
			name: params[:name],
			lastName: params[:lastName],
			birthday: params[:birthday],
			phone: params[phone],
			email: params[:email],
     		password: params[:password],
     		password_confirmation: params[:password]
			})
		u.save 		
	end

	def edit
    u_id=params[:id] 
    @user= User2.where(id: u_id).first
 	end

	 def update
	    u_id=params[:id] 
	    @user= User2.where(id: u_id).first
	    @user.update_attributes(user_params)
	    redirect_to action: :show 
	  end

	 def delete
		#permisos <= devise 
		u_id=params[:id].to_i 
		@user= User2.where(id: u_id).first
		if @user.nil?
		  return redirect_to action: :index
		else
		  @user.destroy 
	    redirect_to action: :index

		end    
	 end

	 def user_params
	 	if @user_params.present?
	 		@user_params
	 	else
	 		@user_params = {	 			
	    	nickname: params[:nickname],
			name: params[:name],
			lastName: params[:lastName],
			birthday: params[:birthday],
			phone: params[:phone],
			email: params[:email]
	 		}
		 	if params[:password].present?
				@params[:password] = params[:password],	
				@params[:password_confirmation] = params[:password]	 		
		 	end
		 	@user_params
	 	end
	 	
	 end
end
