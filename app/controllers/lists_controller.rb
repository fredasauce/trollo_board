class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def index
    @lists = @board.lists.all
  end

  def show
  end

  def new
    @list = @board.lists.new
    render :new
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to board_list_path(@board.id, @list.id)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @list.update(list_params)
      redirect_to board_list_path(@board, @list)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end

  private

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:list_name)
    end

end
