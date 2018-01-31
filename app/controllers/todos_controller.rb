class TodosController < ApplicationController
	before_action :set_todo,only:[:show,:destroy,:edit,:update]
	def new
		@todo= Todo.new
	end

	def show
	end

	def edit
	end

	def create
		@todo= Todo.new(todo_params)
		if @todo.save
			flash[:notice]= "todo has been saved succesfully"
			redirect_to todo_path(@todo)
		else
			render 'new'
		end
	end

	def update
		if @todo.update(todo_params)
			flash[:notice]= "todo has been updated succesfully"
			redirect_to todo_path(@todo)
		else
			render 'new'
		end
	end

	def index
		@todos =Todo.all
	end

	def destroy
		@todo.destroy
		flash[:notice]= "Todo has been deleted succesfully"
		redirect_to todos_path
	end
	
	private

	def set_todo
		@todo =Todo.find(params[:id])
	end
	def todo_params
		params.require(:todo).permit(:name,:description)
	end

end