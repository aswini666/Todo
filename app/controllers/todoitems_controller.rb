class TodoitemsController < ApplicationController

  
  def create
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = @todolist.todoitems.create(todoitem_params)
     redirect_to @todolist
  end

  def destroy
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = @todolist.todoitems.find(params[:id])
    if @todoitem.destroy
      redirect_to @todolist
    end
  end

  def complete
    @todolist = Todolist.find(params[:todolist_id])
    @todoitem = @todolist.todoitems.find(params[:id])
    @todoitem.update_attribute(:completed_at, Time.now)
    redirect_to @todolist, notice: "Successfully marked"
  end

  private
  def todoitem_params
    params.require(:todoitem).permit(:content)
  end
end
