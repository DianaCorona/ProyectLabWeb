class GroupsController < ApplicationController
   def index 
	@group= Group.all	
  	 	respond_to do |f|
		  
		    f.html{}
 		end
	end

	def show
    u_id=params[:id] 
    @group= Group.where(id: u_id).first
	end
	def create
		u= Group.new({
            
			name: params[:name],
			expDate: params[:expDate],
            code: params[:code],
            created_at: params[:created_at],
            updated_at: params[:updated_at]
             
			})
		u.save 		
	end

	def edit
    u_id=params[:id] 
    @group= Group.where(id: u_id).first
 	end

	 def update
	    u_id=params[:id] 
	    @group= Group.where(id: u_id).first
	    @group.update_attributes({
	      	name: params[:name],
			expDate: params[:expDate],
            code: params[:code],
            created_at: params[:created_at],
            updated_at: params[:updated_at]
	      })
	    redirect_to action: :show 
	  end


	 def delete
		#permisos <= devise 
		g_id=params[:id].to_i 
		@group= Group.where(id: g_id).first
		if @group.nil?
		  return redirect_to action: :index
		else
		  @group.destroy 
	    redirect_to action: :index

		end    
	 end
    
    
    
end
