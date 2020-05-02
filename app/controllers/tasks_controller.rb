class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
    @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.js
      else
        # flash[:danger] = "タスクの登録に失敗しました。"
        format.js
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    respond_to do |format|
      @task.destroy
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:text)
  end
end
