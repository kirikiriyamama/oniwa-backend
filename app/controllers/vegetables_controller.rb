class VegetablesController < ApplicationController
  def create
    @vegetable = Vegetable.new(name: params[:name])

    if @vegetable.save
      render json: { vegetable: { id: @vegetable.id, name: @vegetable.name } }
    else
      error_messages = @vegetable.errors.full_messages.map { |message| { message: message } }
      render status: 400, json: { errors: error_messages }
    end
  end
end
