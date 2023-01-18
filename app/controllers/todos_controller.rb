class TodosController < ApplicationController
	before_action :set_todo, only: %i[  edit update destroy ]
	before_action :get_campaign, only: %i[ new edit update create destroy ]

	def index
		@campaign=Campaign.find(params[:campaign_id])
		@todos=@campaign.todos
	end

	def new
		@todo = @campaign.todos.new
		authorize @todo
	end
	
	def edit
		authorize @todo
	end

	def update
	end
	def create
		@campaign = Campaign.find(params[:campaign_id])
		@todo = @campaign.todos.build(todo_params)
		authorize @todo
		if @todo.save
			redirect_to campaign_todos_path(@campaign), notice: "todo was successfully created."
		else
			render :new, alert: "Couldn't create Task"
		end
	end

	def update
		authorize @todo
		if @todo.update(todo_params)
			redirect_to campaign_todos_path(@campaign), notice: "todo was successfully updated."
		else
			render :edi, alert: "Couldn't update Task"
		end

	end

	# DELETE /todos/1 or /todos/1.json
	def destroy
		@campaign=Campaign.find(params[:campaign_id])
		@todo = @campaign.todos.find(params[:id])
		authorize @todo
		@todo.destroy
		redirect_to campaign_todos_path(@campaign), notice: "Task was successfully destroyed."
	end

	private

	def get_campaign			
		@campaign = Campaign.find(params[:campaign_id])
	end

	def set_todo	
		@campaign=Campaign.find(params[:campaign_id])
		@todo = @campaign.todos.find(params[:id])			
	end

	def todo_params
		params.require(:todo).permit(:task)
  end
end