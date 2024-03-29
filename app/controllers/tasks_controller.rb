class TasksController < ApplicationController
 def index
    @tasks = Task.order(:name)
    render('/tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('/tasks/new.html.erb')
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      render('/tasks/success.html.erb')
    else
      render('/tasks/new.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
    render('/tasks/show.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('/tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params[:task])
      if params[:task][:done]
        @tasks = Task.all
        redirect_to('/')
      else
        render('/tasks/update.html.erb')
      end
    else
      render('/tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task_name = @task.name
    @task.destroy
    render('/tasks/destroy.html.erb')
  end
end
