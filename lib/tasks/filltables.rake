require 'csv'

namespace :filltables do

  task seed_country: :environment do
    Country.destroy_all
    Movie.destroy_all

      TitleList9000.destroy_all
  
      CSV.foreach("lib/assets/csv/movies9500.csv", :headers=>true) do |row|
        puts row.inspect
        TitleList9000.create!(
          movieId: row[0],
          title: row[1],
          
          
        )
      end
  
    end

    CSV.foreach("lib/assets/csv/country_centroids.csv", :headers=>true) do |row|
      puts row.inspect
      Country.create!(
        Ctrycode: row[0],
        Lat: row[1],
        Long: row[2],
        Country: row[3],
        
      )
    end

  end


  #place above ids into foreign key

  ctry = Country.all 

    CSV.foreach("lib/assets/csv/movie_5000_v.csv", :headers=>true) do |row|
      puts row.inspect
      Movie.create!(
    Director: row[1],
    Duration: row[3],
    Genre: row[9],
    Title: row[11],
    title_list9000s_id: ,# find word(s) included in string title
    productioncountry: row[20],
    ctry.each do |country|        #if countries match then take country id for this row
      if productioncountry == country
    countries_id: country.id 
     end
    Year: row[23],
    imdbscore: row[25],
      )
    


    end

  end

  task seed_link: :environment do
    Link.destroy_all

    CSV.foreach("lib/assets/csv/links.csv", :headers=>true) do |row|
      puts row.inspect
      Link.create!(
        mId: row[0],
        imdbId: row[1],
        tmdId: row[2],

        
      )
    end

  end

  task seed_tag: :environment do
    Tag.destroy_all

    CSV.foreach("lib/assets/csv/tags.csv", :headers=>true) do |row|

      puts row.inspect
      Tag.create!(
        movieIDk: row[1],
        tags: row[2],
        
      )
    end

  end

  task seed_genre: :environment do
    Genre.destroy_all

    CSV.foreach("lib/assets/csv/genres.csv", :headers=>true) do |row|

      puts row.inspect
      Genre.create!(
        type: row[0],
        
      )
    end

  end



end
