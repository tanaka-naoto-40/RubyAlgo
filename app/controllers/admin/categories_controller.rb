class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i[edit update show destroy]

  def index
    @categories = Category.all
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @category.destroy!
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :content, :tips, :published)
  end
end
