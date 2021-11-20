#encoding: UTF-8
require 'csv'

#import data from provided CSVs

namespace :import do

  desc "Import Directors"
  task directors: :environment do
    print 'importing directors'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      Director.find_or_create_by(name: row["Director"])
      print '.'
    end
  end

  desc "Import Actors"
  task actors: :environment do
    print 'importing actors'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      Actor.find_or_create_by(name: row["Actor"])
      print '.'
    end
  end

  desc "Import Studios"
  task studios: :environment do
    print 'importing studios'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      Studio.create_with(country: row["Country"]).find_or_create_by(name: row["Filming location"])
      print '.'
    end
  end

  desc "Import Movies"
  task movies: :environment do
    print 'importing movies'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      Movie.create_with(
        description:  row["Description"],
        year:         row["Year"].to_s,
        director_id:     Director.find_by_name(row["Director"]).id
      ).find_or_create_by(title: row["Movie"])
      print '.'
    end
  end

  desc "Import Locations"
  task film_locations: :environment do
    print 'importing locations'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      FilmLocation.where(
        movie_id: Movie.find_by_title(row["Movie"]).id,
        studio_id: Studio.find_by_name(row["Filming location"]).id
      ).first_or_create
      print '.'
    end
  end

  desc "Import Stars"
  task movie_actors: :environment do
    print 'importing movie stars'
    CSV.read("#{Rails.root}/storage/movies.csv", headers: true).each do | row |
      MovieActor.where(
        movie_id: Movie.find_by_title(row["Movie"]).id,
        actor_id: Actor.find_by_name(row["Actor"]).id
      ).first_or_create
      print '.'
    end
  end

  desc "Import Reviewers"
  task reviewers: :environment do
    print 'importing reviewers'
    CSV.read("#{Rails.root}/storage/reviews.csv", headers: true).each do | row |
      Reviewer.find_or_create_by(username: row["User"])
      print '.'
    end
  end

  desc "Import reviews"
  task reviews: :environment do
    print 'importing reviews'
    CSV.read("#{Rails.root}/storage/reviews.csv", headers: true).each do | row |
      Review.where(
        movie_id: Movie.find_by_title(row["Movie"]).id,
        reviewer: Reviewer.find_by_username(row["User"]).id,
        stars:    row["Stars"].to_i,
        review:   row["Review"]
      ).first_or_create
      print '.'
    end
  end


  desc "Import All"
  task all: [:directors, :actors, :studios, :movies, :film_locations, :movie_actors, :reviewers, :reviews]

end
