class GroupListController < ApplicationController

  def index
    user=current_user2
    @grupos=Group_list.where({id: received_id}).all
    render json: {group: @grupos}
  end

end
