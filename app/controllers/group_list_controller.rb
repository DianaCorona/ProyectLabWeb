class GroupListController < ApplicationController

  def index

  end


  def show
    g_id=params[:id]

    render json: {listg:  Group.where("id" => g_id).first}


  end


  def create

    @id_u=params[:id_u]
    @id_g=params[:id_g]
    gl= GroupList.new({
        user2_id: @id_u,
        group_id: @id_g

      })
      gl.save
      render json: {grouplist: gl}

  end

  def update

    l=Group.find(params[:id])

	  # l.update(
    #   l.name: params[:name],
    #   l.expDate: params[:expDate]
    #   )

  l.update_attributes(name: params[:listg][:name], expDate: params[:listg][:exp_date])
    # 2) l.name = params[:name]
    #     l.expDate = params[:expDate]
    #     l.save

	    render json: {user: l }
  end
end
