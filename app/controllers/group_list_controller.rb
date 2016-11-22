class GroupListController < ApplicationController

  def index

  end


  def show
    g_id=params[:id]

    render json: {listg:  Group.where("id" => g_id).first}


  end
end
