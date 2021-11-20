class PagesController < ApplicationController

  def home
    @movies = Movie.all
    if params[:search]
      @actors = Actor.where("name LIKE ?", "%#{params[:search]}%")
    end
  end

  def assignment_one
  end


end
