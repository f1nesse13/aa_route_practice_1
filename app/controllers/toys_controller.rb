class ToysController < ApplicationController
  def index
    cat = Cat.find(params[:cat_id])
    render json: cat.toys
  end

  def show
    render json: Toy.find(params[:id])
  end

  def new
    @cat = Cat.find(params[:cat_id])
    @toy = Toy.new
    render :new
  end

  def create
    @toy = Toy.new(toy_params)
    @cat = @toy.cat
    if @toy.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.delete
    render json: toy
  end

  def update
    toy = Toy.find(params[:id])
    if toy.update(toy_params)
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  def toy_params
    params.require(:toy).permit(:name, :ttype, :cat_id)
  end
end
