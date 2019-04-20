class CatsController < ApplicationController
  def index
    render json: Cat.all
  end

  def show
    cat = Cat.find_by({ id: params[:id] })
    render json: cat
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      render json: cat
    else
      render json: cat.errors.full_message, status: :unprocessable_entity
    end
  end

  def update
    cat = Cat.find_by({ id: params[:id] })

    if cat.update(cat_params)
      render json: cat
    else
      render json: cat.errors.full_message, status: :unprocessable_entity
    end
  end

  def destroy
    cat = Cat.find_by({ id: params[:id] })

    if cat.destroy
      render json: cat
    else
      render json: cat.errors.full_message, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cats).permit(:name, :age)
  end
end
