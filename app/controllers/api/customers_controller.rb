class Api::CustomersController < ApplicationController
  # before_action :doorkeeper_authorize!
  def create
    @customer = Customer.new(create_params)

    if @customer.save
      render json: { customer: @customer, success: true}
    else
      render json: { message: @customer.errors.messages, success: false}
    end
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    if @customer.update(update_params)
      render json: { customer: @customer, success: true}
    else
      render json: { message: @customer.errors.messages, success: false}
    end
  end

  def show
    @customer = Customer.find_by(id: params[:id])
    if @customer.present?
      render json: { success: true, customer: @customer }, status: 200
    else
      render json: { success: false, customer: @customer, message: "not found" }, status: 404
    end
  end

  private

  def create_params
    params.permit(:name, :email, :mobile, :password)
  end

  def update_params
    params.permit(:name, :email, :mobile)
  end
end
