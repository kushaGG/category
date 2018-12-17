class ProductsController < ApplicationController
	before_action :authenticate_user! ,only:[:new, :edit, :update, :destroy]
	before_action :find_product, only:[:show, :edit, :update, :destroy]
  def index
  	@products = Product.all
  	@profile = Profile.find_by(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(prod_params)
  	redirect_to product_path(@product.id) if @product.save
  end

  def show
  end

  def edit
  end

  def update
  	if @product.update(prod_params)
  		redirect_to product_path(@product.id)
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to root_path
  end
  private
  def prod_params
    params.require(:product).permit(:title, :description, :price)
  end
  def find_product
  	@product = Product.find_by(params[:id])
  end
end
