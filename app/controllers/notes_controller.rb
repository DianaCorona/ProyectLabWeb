class NotesController < ApplicationController
#  get 'notes' => 'notes#index', as: :all_notes
#  get 'notes/new' => 'notes#new', as: :new_notes
#  post 'notes/create' => 'notes#create'
#  get 'notes/:id' => 'notes#show', as: :see_one_notes
#  delete 'notes/:id/borrar' => 'notes#delete', as: :delete_notes
    def index
		@notes= Note.all
  	 	render json: {note: @notes}
	end
	def show
    	n_id=params[:id]
    	render status: 404 
    	render json: {note: Note.where("id" => n_id)}
    	@notes= Note.where(id: n_id).first
	end
	def create
        n= Note.new(note_params)
		n.save
		render json: {note: notes}
	end

	 def delete
		#permisos <= devise
		n_id=params[:id].to_i
		@notes= Note.where(id: g_id).first
		@notes.destroy
		render json: {note: notes}
	 end

	 def note_params
	 	if @note_params.present?
	 		@note_params
	 	else
	 		@note_params = params.require(:note).permit(:group_id, :message, :expDate, :title)
		end	 	
	 end



end
