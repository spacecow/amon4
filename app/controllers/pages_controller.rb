class PagesController < ApplicationController

  def show
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

  private

    def pages_params
      params.require(:page).permit(:menu,:title,:subtitle)
    end

end
