class PagesController < ApplicationController

  def home
    @movies = Movie.all
  end

  def assignment_one
  end


end
