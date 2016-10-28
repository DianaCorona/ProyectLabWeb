class NotesController < ApplicationController
#  get 'notes' => 'notes#index', as: :all_notes
#  get 'notes/new' => 'notes#new', as: :new_notes
#  post 'notes/create' => 'notes#create'
#  get 'notes/:id' => 'notes#show', as: :see_one_notes
#  delete 'notes/:id/borrar' => 'notes#delete', as: :delete_notes
     def index
	@notes= Note.all
  	 	respond_to do |f|
		     f.json{}
		    f.html{}
 		end
	end

	def show
    u_id=params[:id]
    @notes= Note.where(id: u_id).first
	end
	def create
        u= Group.new({
			group_id: params[:group_id],
			message: params[:message],
            expDate: params[:expDate],
            created_at: params[:created_at],
            updated_at: params[:updated_at]

			})
		u.save
	end

	 def delete
		#permisos <= devise
		g_id=params[:id].to_i
		@notes= Note.where(id: g_id).first
		if @notes.nil?
		  return redirect_to action: :index
		else
		  @notes.destroy
	    redirect_to action: :index

		end
	 end



end
