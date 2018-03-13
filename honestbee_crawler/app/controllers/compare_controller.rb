class CompareController < ApplicationController
  def show
    @products=Product.select("id,product_name,product_price,source_store").where('product_name like ?' , "%#{params[:keyword]}%")
    respond_to do |format|
      format.json {render :json => @products.to_json}
    end
  end
end
