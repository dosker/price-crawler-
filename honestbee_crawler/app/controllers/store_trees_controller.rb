class StoreTreesController < ApplicationController
  before_action :set_store_tree, only: [:show, :edit, :update, :destroy]

  # GET /store_trees
  # GET /store_trees.json
  def index
    @store_trees = StoreTree.all
  end

  # GET /store_trees/1
  # GET /store_trees/1.json
  def show
  end

  # GET /store_trees/new
  def new
    @store_tree = StoreTree.new
  end

  # GET /store_trees/1/edit
  def edit
  end

  # POST /store_trees
  # POST /store_trees.json
  def create
    @store_tree = StoreTree.new(store_tree_params)

    respond_to do |format|
      if @store_tree.save
        format.html { redirect_to @store_tree, notice: 'Store tree was successfully created.' }
        format.json { render :show, status: :created, location: @store_tree }
      else
        format.html { render :new }
        format.json { render json: @store_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_trees/1
  # PATCH/PUT /store_trees/1.json
  def update
    respond_to do |format|
      if @store_tree.update(store_tree_params)
        format.html { redirect_to @store_tree, notice: 'Store tree was successfully updated.' }
        format.json { render :show, status: :ok, location: @store_tree }
      else
        format.html { render :edit }
        format.json { render json: @store_tree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_trees/1
  # DELETE /store_trees/1.json
  def destroy
    @store_tree.destroy
    respond_to do |format|
      format.html { redirect_to store_trees_url, notice: 'Store tree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_tree
      @store_tree = StoreTree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_tree_params
      params.require(:store_tree).permit(:page_title)
    end
end
