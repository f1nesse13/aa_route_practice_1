class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by({ id: params[:id] })
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    # render :edit
  end

  def update
    @cat = Cat.find_by({ id: params[:id] })

    if @cat.update(cat_params)
      render :show
    else
      render json: cat.errors.full_message, status: :unprocessable_entity
    end
  end

  def destroy
    cat = Cat.find_by({ id: params[:id] })

    if cat.destroy
      redirect_to cats_url
    else
      render json: cat.errors.full_message, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end
