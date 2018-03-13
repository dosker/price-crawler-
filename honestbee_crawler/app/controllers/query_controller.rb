class QueryController < ApplicationController
  def show
    @products=Product.select("id,product_name,product_price").where(:source_store => params[:id])
    respond_to do |format|
      format.json {render :json => @products.to_json}
    end
  end
end
