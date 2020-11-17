class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]

 
  def index
    @todolists = Todolist.all
  end

  def show
  end

  def new
    @todolist = Todolist.new
  end

  def edit
  end

  def create
    @todolist = Todolist.new(todolist_params)

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to @todolist, notice: 'Todolist was successfully created.' }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.html { redirect_to @todolist, notice: 'Todolist was successfully updated.' }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todolist.destroy
    respond_to do |format|
      format.html { redirect_to todolists_url, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todolist_params
      params.require(:todolist).permit(:title, :description)
    end
end
