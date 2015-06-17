class PagesController < ApplicationController

  def show
    id = params[:id] || Page.first.id
    @page = Page.find id
  end

  def index
  end

  def new
    require_login
    @page = Page.new
  end

  def create
    require_login
    @page = Page.new pages_params
    if @page.save
      redirect_to @page
    else
      render :new
    end
  end

  def edit
    require_login
    @page = Page.find params[:id]
  end

  def update
    require_login
    @page = Page.find params[:id]
    if @page.update pages_params
      redirect_to @page
    else
      render :edit
    end
  end

  private

    def pages_params
      params.require(:page).permit(:menu,:title,:subtitle,:pos,:content)
    end

    def require_login
      redirect_to root_path and return if current_user_id.nil?
    end

end
