class VegetablesController < ApplicationController
  def index
    @vegetables = Vegetable.all.map { |vegetable| { id: vegetable.id, name: vegetable.name } }

    render json: { vegetables: @vegetables }
  end

  def create
    @vegetable = Vegetable.new(name: params[:name])

    if @vegetable.save
      render json: { vegetable: { id: @vegetable.id, name: @vegetable.name } }
    else
      error_messages = @vegetable.errors.full_messages.map { |message| { message: message } }
      render status: 400, json: { errors: error_messages }
    end
  end

  def update
    @vegetable = Vegetable.find(params[:id])

    if @vegetable.update(name: params[:name])
      render json: { vegetable: { id: @vegetable.id, name: @vegetable.name } }
    else
      error_messages = @vegetable.errors.full_messages.map { |message| { message: message } }
      render status: 400, json: { errors: error_messages }
    end
  end
end
