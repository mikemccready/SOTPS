class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find(params[:id])
    @posts = @category.post.find(params[:id])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @categories = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end