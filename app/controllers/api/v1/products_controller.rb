class Api::V1::ProductsController < ApplicationController
  # protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :null_session
  # before_action :skip_authenticity_token
  # skip_before_filter :verify_authenticity_token, only: [:create]

  def index
    user_id = User.find_by(handle: params[:handle])
    @user_products = Product.where(user: user_id)
    render json: @user_products
  end

  def show
    user_id = User.find_by(handle: params[:handle])
    @user_product = Product.find_by(product_name: params[:product_name])
    render json: @user_product
  end

  def update
    user_id = User.find_by(handle: params[:handle])
    @user_product = Product.find_by(product_name: params[:product_name])
    @user_product.update(product_settings_params)
    @user_product.save
    render json: @user_product
  end

  def product_settings_params
    params.permit(:active_api, :active_color_palette)
  end

end
