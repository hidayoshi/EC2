class Admins::ProductsController < Admins::ApplicationController

  def new
    @product = current_admin.products.build
  end

  def create
    @product = current_admin.products.build(product_params)
    if @product.save
      redirect_to root_path, notice: "Product successfully created"
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :unit, :image)
  end
end