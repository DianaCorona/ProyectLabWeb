class GroupsController < ApplicationController

  skip_before_filter :authenticate_user_from_token!, only: [:create]
	skip_before_filter :authenticate_user2!, only: [:create]

   def index
	@group= Group.all
  	 	respond_to do |f|
        f.json{}
       f.html{}
 		end
	end

	def show
    g_id=params[:id]
    @group= Group.where(id: u_id).first
	end
	def create


		g= Group.new({

			name: params['group'][:name],
			expDate: params['group'][:exp_date],
      code: params['group'][:id_user],
      created_at: nil,
      updated_at: nil
			})
		g.save

  redirect_to action: :new
	end

	def edit
    g_id=params[:id]
    @group= Group.where(id: u_id).first
 	end

	 def update
	    g_id=params[:id]
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
