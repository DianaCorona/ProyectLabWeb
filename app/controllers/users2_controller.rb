class Users2Controller < ApplicationController
	skip_before_filter :authenticate_user_from_token!, only: [:create]
	skip_before_filter :authenticate_user2!, only: [:create]
	def index
	@user= User2.all
  	 	respond_to do |f|
		  	f.json{}
		    f.html{}
 		end
	end
	def show
	    u_id=params[:id]
	    render status: 404 and return if u_id != 'me'
	    render json: {user: current_user2 }
	end

	def create
		u= User2.new(user_params)
		u.save
		render json: {user: u}
	end

	def edit
    u_id=params[:id]
    @user= User2.where(id: u_id).first
 	end

	def update
		u_id = params[:id].to_i
		render json: {error: 'Unauthorized'}, status: 403 and return if !valid_params || u_id != current_user2.id
		user = User2.where(id: u_id).first
		user.update_attributes(user_params)
		render json: {user: current_user2 }
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
			@user_params = params.require(:user).permit(:nickname, :name, :lastName, :birthday, :phone, :email, :password)
		 	if !@user_params[:password].present?
				@user_params.delete(:password)
			else
				@user_params[:password_confirmation] = @user_params[:password]
		 	end
		 	@user_params
	 	end
	 end

	def valid_params
		user_params[:nickname].present?
	end
end
