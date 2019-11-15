require 'csv'

namespace :filltables do

  task seed_one: :environment do

    Movie.destroy_all
    Country.destroy_all
    Genre.destroy_all
    Merchandise.destroy_all
    
    ActiveRecord::Base.connection.execute("SET session_replication_role = 'replica';")


  
      CSV.foreach("lib/assets/csv/genres.csv", :headers=>true) do |row|
  
        puts row.inspect
        Genre.create!(
          genre: row[0],
          
        )
      end
  
    p "Basic genre list matching was added"
  

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
      prices = [5.99, 6.99, 10, 3.99]
      itemtype = "poster"
  
      Merchandise.create!(
        name: row[11],
        price: prices.sample,
      details: itemtype,
      )
    end
    p "movie item names added"

    # statustype = ["shipped", "pending"]
    # total = [5.99, 6.99, 10, 3.99, 7.98, 30, 20, 13.98, 11.98, 50, 23.96]


    # @order = Orders.all 
    # @order.each do |o|
    #   status: statustype.sample

    # end

# merchidtitle = Hash.new { |id, t| id[t] = []}
# countryidnames = Hash.new { |c_id, n| c_id[n] = []}
# csvfkcountry = []
# csvfkmerch =[]



# @merch = Merchandise.all
# @merch.each do |merch|
#   puts merch.inspect 
#   merchidtitle[merch.id] << merch.name 
# end 

# @ctrys = Country.all 
# @ctrys.each do |c|
#   puts c.inspect
#   countryidnames[c.id] << c.Country
# end


#     CSV.foreach("lib/assets/csv/movie_5000_v.csv", :headers=>true) do |row|
#       eleven = row[11]
#       twenty = row[20]

#       if eleven == nil 
#         next
#       elsif 


#     end



  #two hashes with nested loops and sanitized before is needed here to maintain FK constraints
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
     #countries_id: 
     #merchandises_id: 
      )
    end


    
  

    movie = Movie.select(:id, :productioncountry, :Title)
    movie.each do |m|        
      puts m.inspect

      v = m.Title
      @ttle = "%" + v.gsub("'", "''").gsub(/\A\p{Space}*|\p{Space}*\z/, '') + "%"  
      puts @ttle

      if m.productioncountry == nil || m.productioncountry == 'New Line' || m.productioncountry == 'Official site'
      sql = <<-SQL 
      UPDATE movies SET countries_id = null WHERE movies.id = #{m.id}; 
      SQL
      ActiveRecord::Base.connection.execute(sql)
      elsif m.productioncountry == 'Soviet Union'
        relid1 = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = 'Russia'")
        sql = <<-SQL 
        UPDATE movies SET countries_id = #{relid1[0].id} WHERE movies.id = #{m.id}; 
        SQL
        ActiveRecord::Base.connection.execute(sql)
      elsif m.productioncountry == 'West Germany'
        relid2 = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = 'Germany'")

        sql = <<-SQL 
        UPDATE movies SET countries_id = #{relid2[0].id} WHERE movies.id = #{m.id}; 
        SQL
        ActiveRecord::Base.connection.execute(sql)

      else
      ctrytableid = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = '#{m.productioncountry}'")
      puts ctrytableid[0].id.inspect

      titlematch = Merchandise.find_by_sql("SELECT id FROM merchandises WHERE name LIKE '#{@ttle}' ")
      puts titlematch[0].id.inspect
      
      sql = <<-SQL 
      UPDATE movies SET countries_id = #{ctrytableid[0].id}, merchandises_id = #{titlematch[0].id}
      WHERE movies.id = #{m.id}; 
      SQL
      ActiveRecord::Base.connection.execute(sql)
    end
  end

  ActiveRecord::Base.connection.execute("SET session_replication_role = 'origin';")


end
end





# ActiveRecord::Base.connection.execute("
#   UPDATE movies SET countries_id = AS(SELECT id FROM countries WHERE \"Country\" = '#{m.productioncountry}' ),
#    merchandises_id = AS(SELECT id FROM merchandises WHERE name LIKE '#{m.select(:Title).gsub("'", "''").gsub(/\A\p{Space}*|\p{Space}*\z/, '')}'),
#       WHERE movies.id = #{m.id};")

#       ActiveRecord::Base.connection.execute("SELECT id FROM countries WHERE \"Country\" = '#{m.productioncountry}'")
#       ActiveRecord::Base.connection.execute("SELECT id FROM merchandises WHERE name LIKE '%#{m.select(:Title).gsub("'", "''").gsub(/\A\p{Space}*|\p{Space}*\z/, '')}%'")

###############no longer needed as table dropped due to heroku constraints
############### but has some useful stuff

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
  # end