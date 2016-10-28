class EventController < ApplicationController
   def index
 @event = Event.all
     respond_to do |f|
      f.html{}
   end
 end

 def show
     event_id = params[:id]
     @event = Event.where(id: event_id).first
 end

 def create
  event = Event.new({
   name: params[:name],
   date: params[:date],
            description: params[:description],
            calendar_id: params[:calendar_id],
            grupo_id: params[:grupo_id]
  })
  event.save
 end

 def edit
     event_id=params[:id]
     @event = Event.where(id: event_id).first
  end

  def update
     event_id=params[:id]
     @event= Event.where(id: event_id).first
     @event.update_attributes({
        name: params[:name],
   date: params[:date],
            description: params[:description],
            calendar_id: params[:calendar_id],
            grupo_id: params[:grupo_id]
       })
     redirect_to action: :show
   end


  def delete
  #permisos <= devise
  event_id = params[:id].to_i
  @event= Event.where(id: event_id).first
  if @event.nil?
    return redirect_to action: :index
  else
    @event_id.destroy
     redirect_to action: :index
  end
  end
end
