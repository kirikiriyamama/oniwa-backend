class VegetablesController < ApplicationController
  def create
    @vegetable = Vegetable.new(name: params[:name])

    if @vegetable.save
      render json: { vegetable: { id: @vegetable.id, name: @vegetable.name } }
    end
  end
end
