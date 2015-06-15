class PagesController < ApplicationController

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new pages_params
    @page.save
    redirect_to @page
  end

  private

    def pages_params
      params.require(:page).permit(:menu)
    end

end
