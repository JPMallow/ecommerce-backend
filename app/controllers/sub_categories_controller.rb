# app/controllers/sub_categories_controller.rb
class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_categories = SubCategory.all
  end

  def show
  end

  def new
    @sub_category = SubCategory.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)
    if @sub_category.save
      redirect_to @sub_category, notice: 'SubCategory was successfully created.'
    else
      render :new
    end
  end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to @sub_category, notice: 'SubCategory was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sub_category.destroy
    redirect_to sub_categories_index_url, notice: 'Sub category was successfully destroyed.'
  end

  private
  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id)
  end
end