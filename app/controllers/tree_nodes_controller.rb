class TreeNodesController < ApplicationController
  include SortableTreeController::Sort
  sortable_tree 'TreeNode', {parent_method: 'parent'}
  load_and_authorize_resource except: [:sort, :manage]
  before_filter :authorize_sort, only: :sort
  
  def manage
    authorize! :manage, TreeNode
    @items = TreeNode.all.arrange(:order => :pos)
  end
  
  # GET /tree_nodes/new
  def new
    @tree_node.color = '#EEEEEE'
  end

  # GET /tree_nodes/1/edit
  def edit
  end

  # POST /tree_nodes
  def create
    @tree_node = TreeNode.new(resource_params)
    if @tree_node.save
      redirect_to manage_tree_nodes_path, notice: 'TreeNode was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tree_nodes/1
  def update
    if @tree_node.update(resource_params)
      redirect_to manage_tree_nodes_path, notice: 'TreeNode was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tree_nodes/1
  def destroy
    @tree_node.destroy
    redirect_to manage_tree_nodes_url, notice: 'TreeNode was successfully destroyed.'
  end
  
  private
  def authorize_sort
    authorize! :sort, TreeNode
  end
  # Only allow a trusted parameter "white list" through.
  def resource_params
    params[:tree_node].permit(:name, :note, :parent_id, :color)
  end
end