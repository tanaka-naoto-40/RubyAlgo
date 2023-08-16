class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i[edit update show destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Categoryを作成しました'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_category_path(@category), notice: 'Categoryを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy!
    redirect_to admin_categories_path, notice: 'Categoryを削除しました'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :content, :id)
  end
end
