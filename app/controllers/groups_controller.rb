class GroupsController < ApplicationController

  skip_before_filter :authenticate_user_from_token!, only: [:create]
	skip_before_filter :authenticate_user2!, only: [:create]

   def index
	@groups= Group.all
  	 	respond_to do |f|
        f.json{}
       f.html{}
 		end
    render json: {listg: @groups }
	end

	def show
    g_id=params[:id]
    user2= User2.where(id: current_user2).first
    #gr=GroupList.where(user2_id: user2.id)
    gr=GroupList.where(user2_id: user2.id ).to_a
    k=Array.new
    a=0
    gr.size.times do |i|
      if !Group.where(id: gr[i].group_id).where.not(name: nil).blank?
        k+=Group.where(id: gr[i].group_id).where.not(name: nil)
      end
    end
    render json: {listg: k}


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
    @Id_user= User2.where(email: g.code).first
    gl= GroupList.new({
        user2_id: @Id_user.id,
        group_id: g.id

      })
      gl.save
      chat=Chat.new({
        group_id: gl.group_id
        })
        chat.save

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
