class HomeController < ApplicationController
  def index
    @page_title = "Home Page"
    @page_description = "This is a home page of a revolutionary new product."
    @page_keywords = "Ruby, Rails, TailwindCSS, New product"
  end
end