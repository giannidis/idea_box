class IdeasController < ApplicationController
	before_action :find_idea, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@idea = Idea.all.order("created_at DESC")

		if params[:tag].present? 
      @idea = Idea.tagged_with(params[:tag])
    else
      @idea = Idea.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
      respond_to do |format|
	      format.html  #index.html.erb
	      format.json { render json: @ideas }
      end 
    end  
	end

	
	def show
	end

	def new
		@idea = current_user.ideas.build
	end


	def create
		@idea = current_user.ideas.build(idea_params)
		if @idea.save
			redirect_to @idea, notice: "Succesfully created new idea"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @idea.update(idea_params)
		redirect_to @idea
		else
		render 'edit'
		end
	end

	def destroy
		@idea.destroy
		redirect_to root_path, notice: "Succesfully deleted idea"
	end

	
	private

	def idea_params
		params.require(:idea).permit(:title, :description, :image, :tag_list, requirements_attributes: [:id, :name, :_destroy], qualifications_attributes: [:id, :add, :_destroy])
	end

	def find_idea
		@idea = Idea.find(params[:id])		
	end

	
end
