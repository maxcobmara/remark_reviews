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

end
