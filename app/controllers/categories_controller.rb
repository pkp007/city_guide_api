class CategoriesController < ApplicationController
before_filter :authenticate_user! , except: [:index, :show]

  def index
    @categories = Category.all
  end

def show
  @category = Category.find(params[:id])
end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new (category_params)
    if @category.save!
      redirect_to @category, notice: 'Category was successfully added.'

    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
def update
@category = Category.find(params[:id])
if @category.update(category_params)
  redirect_to categories_path , notice: 'Category updated successfully'
else
  redirect_to edit_category_path
end
end
  private
  def category_params
    params.require(:category).permit(:category_name,:picture)
  end
end
