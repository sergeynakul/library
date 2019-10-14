class HomeController < ApplicationController
  def index
    @groups = Group.includes(:books)
  end
end
