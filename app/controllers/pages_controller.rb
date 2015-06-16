class PagesController < ApplicationController

  def show
    @page = Page.find params[:id]
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new pages_params
    if @page.save
      redirect_to @page
    else
      render :new
    end
  end

  def edit
    @page = Page.find params[:id]
  end

  def update
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

end
