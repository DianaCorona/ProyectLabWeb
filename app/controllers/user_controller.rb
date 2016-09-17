class UserController < ApplicationController

	def index 
	@user= User.all	
  	 	respond_to do |f|
		  
		    f.html{}
 		end
	end

	def show
    u_id=params[:id] 
    @user= User.where(id: u_id).first
	end
	def create
		u= User.new({
			userName: params[:username],
			password: params[:password]
			})
		u.save 	
		c = Contact.new({
			user_id: params[:id],
			name: params[:name],
			lastName: params[:lastName],
			birthday: params[:birthday],
			email: params[:email],
			})	
		c.save	
	end

	def edit
    u_id=params[:id] 
    @user= User.where(id: u_id).first
 	end

	 def update
	    u_id=params[:id] 
	    @user= User.where(id: u_id).first
	    @user.update_attributes({
	      	userName: params[:username],
			password: params[:password]
	      })
	    redirect_to action: :show 
	  end

	 def delete
		#permisos <= devise 
		u_id=params[:id].to_i 
		@user= User.where(id: u_id).first
		if @user.nil?
		  return redirect_to action: :index
		else
		  @user.destroy 
	    redirect_to action: :index

		end    
	 end
end
