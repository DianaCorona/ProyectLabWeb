class NotesController < ApplicationController
#  get 'notes' => 'notes#index', as: :all_notes
#  get 'notes/new' => 'notes#new', as: :new_notes
#  post 'notes/create' => 'notes#create'
#  get 'notes/:id' => 'notes#show', as: :see_one_notes
#  delete 'notes/:id/borrar' => 'notes#delete', as: :delete_notes
    def index
    	u_id=User2.where(id: current_user2).first
		#@notes= Note.where(group_id: g_id).all
		#@notes= Note.includes(:group => :user2).where(:group_id => u_id).all
		#notes = Note.includes.all
		#@grupos_usuario = GroupList.includes(:group=>:note).where(:user2_id => u_id).all
		@notas = Note.joins("inner join group_lists on group_lists.group_id = notes.group_id").where(:group_lists => {:user2_id => u_id }).all
  	 	return render json: {notes: @notas}
	end
	def show
    	n_id=params[:id]
    	render status: 404 
    	render json: {note: Note.where("id" => n_id)}
    	@notes= Note.where(id: n_id).first
	end
	
	def create
        @notes= Note.new(note_params)
		@notes.save
		render json: {note: @note}
	end

	def update
		n_id=params[:id]
		@notes= Note.where(id: n_id).first
		@notes.update_attributes(note_params)
		render json: {note: @notes}
	end

	 def delete
		#permisos <= devise
		n_id=params[:id].to_i
		@notes= Note.where(id: n_id).first
		@notes.destroy
		render json: {note: @notes}
	 end

	 def note_params
	 	if @note_params.present?
	 		@note_params
	 	else
	 		@note_params = params.require(:note).permit(:group_id, :title, :message, :expDate )
		end	 	
	 end



end
