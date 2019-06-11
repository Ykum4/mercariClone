class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def sub_category
    # ajax通信の時にしているdataがparamsとして飛んでくる
    @sub_categories = Category.sub_category(params[:id]) #sub_categoryはmodelで定義しているscope
    respond_to do |format|
      format.json
    end
  end

  def mini_category
    @mini_categories = Category.mini_category(params[:id])
    respond_to do |format|
      format.json
    end
  end
end
