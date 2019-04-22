class Toy_Controller < ApplicationController
  def index
    render json: Toy.all
  end

  def show
    render json: Toy.find(params[:id])
  end

  def create
    toy = Toy.new(
      cat_id: params[:cat_id],
      name: params[:name],
      type: params[:type],
    )

    if toy.save
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
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
    params.require(:toy).permit(:name, :type)
  end
end
