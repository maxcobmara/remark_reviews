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

  desc "Import All"
  task all: [:directors, :actors, :studios]

end
