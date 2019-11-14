require 'csv'

namespace :filltables do

  task seed_one: :environment do
    Country.destroy_all
    Movie.destroy_all
    Genre.destroy_all
  
      CSV.foreach("lib/assets/csv/genres.csv", :headers=>true) do |row|
  
        puts row.inspect
        Genre.create!(
          type: row[0],
          
        )
      end
  
    p "Basic genre list for matching was added"
  

    CSV.foreach("lib/assets/csv/country_centroids.csv", :headers=>true) do |row|
      puts row.inspect
      Country.create!(
        Ctrycode: row[0],
        Lat: row[1],
        Long: row[2],
        Country: row[3],
        
      )
    end
  
    CSV.foreach("lib/assets/csv/movie_5000_v.csv", :headers=>true) do |row|
      
      puts row.inspect
      Movie.create!(
    Director: row[1],
    Duration: row[3],
    actor2: row[6],
    Genre: row[9],
    actor1: row[10],
    Title: row[11],
    keywords: row[16],
    language: row[19],
    productioncountry: row[20],
    contentrating: row[21],
    Year: row[23],
    imdbscore: row[25],
     #countries_id: nil,
     #title_list9000s_id: nil,
      )
    end

    #task seed_three: :environment do

    movie = Movie.select(:id, :productioncountry)
    movie.each do |m|        
      puts m.inspect
      if m.productioncountry == nil || m.productioncountry == 'New Line' || m.productioncountry == 'Official site'
      sql = <<-SQL 
      UPDATE movies SET countries_id = null WHERE movies.id = #{m.id}; 
      SQL
      ActiveRecord::Base.connection.execute(sql)
      elsif m.productioncountry == 'Soviet Union'
        sql = <<-SQL 
        UPDATE movies SET countries_id = '678' WHERE movies.id = #{m.id}; 
        SQL
        ActiveRecord::Base.connection.execute(sql)
      elsif m.productioncountry == 'West Germany'
        sql = <<-SQL 
        UPDATE movies SET countries_id = '544' WHERE movies.id = #{m.id}; 
        SQL
        ActiveRecord::Base.connection.execute(sql)

      else
      ctrytableid = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = '#{m.productioncountry}'")
      puts ctrytableid[0].id.inspect
      
      sql = <<-SQL 
      UPDATE movies SET countries_id = #{ctrytableid[0].id} WHERE movies.id = #{m.id}; 
      SQL
      ActiveRecord::Base.connection.execute(sql)
    end

     
    
  end
p "country foreign keys added to Movie table"

end


  ###############no longer needed but has some useful stuff
  # task seed_four: :environment do
  #   movie = Movie.select(:id, :Title)
  #   movie.each do |m|        
  #     puts m.inspect
  #    v = m.Title
  #     @ttle = "%" + v.gsub(/\A\p{Space}*|\p{Space}*\z/, '') + "%"  
  #     #@ttle
  #     puts @ttle

  #     if m.Title == nil 
  #       sql = <<-SQL 
  #     UPDATE movies SET title_list9000s_id = null WHERE movies.id = #{m.id}; 
  #     SQL
  #     ActiveRecord::Base.connection.execute(sql)
  #     p "updated to null"
      
  #     else
  #     titlematch = TitleList9000.find_by_sql("SELECT id FROM title_list9000s WHERE title LIKE '#{@ttle.gsub("'", "''")}' ")
  #     if titlematch.empty?
  #       next 
  #     else
  #     puts titlematch[0].id.inspect
  #     sql = <<-SQL 
  #     UPDATE movies SET title_list9000s_id = #{titlematch[0].id} WHERE movies.id = #{m.id}; 
  #     SQL
  #     ActiveRecord::Base.connection.execute(sql)
  #     end
  #     end
  #   end
  # end

  # task seed_link: :environment do
  #   Link.destroy_all

  #   CSV.foreach("lib/assets/csv/links.csv", :headers=>true) do |row|
  #     puts row.inspect
  #     Link.create!(
  #       mId: row[0],
  #       imdbId: row[1],
  #       tmdId: row[2],

        
  #     )
  #   end

  # end

  # task seed_tag: :environment do
  #   Tag.destroy_all

  #   CSV.foreach("lib/assets/csv/tags.csv", :headers=>true) do |row|

  #     puts row.inspect
  #     Tag.create!(
  #       movieIDk: row[1],
  #       tags: row[2],
        
  #     )
  #   end

  # end


