class PagesController < ApplicationController
  def home
    byebug
    @posts = Blog.all
  end

  def about
  end

  def contact
  end
end
