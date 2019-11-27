require 'csv'
require 'bcrypt'

namespace :filltables do

  task seed_one: :environment do

    Movie.destroy_all
    Country.destroy_all
    #Genre.destroy_all
    Merchandise.destroy_all
    
    

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

@csvarray1 = []
@csvarray2 = []

    CSV.foreach("lib/assets/csv/movie_5000_v.csv", :headers=>true) do |row|
      title = row[11]
      country = row[20]
      puts country

      t = "%" + title.gsub("'", "''").gsub(/\A\p{Space}*|\p{Space}*\z/, '') + "%"
      puts t
      temp_t = Merchandise.find_by_sql("SELECT id FROM merchandises WHERE name LIKE '#{t}' ")
      puts temp_t[0].id.inspect
      @csvarray1 << temp_t[0].id


      temp = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = '#{country}'")
      if temp.empty?
        temp = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = 'Unknown'")
      end
      puts temp[0].id.inspect
      @csvarray2 << temp[0].id

     end

     p "success !"


     @counter = 0
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
     countries_id: @csvarray2[@counter],
     merchandises_id: @csvarray1[@counter],
      )

      @counter += 1
    end
  end 


  #creating fake users 
  verysecure = ["dogs1234", "hye8f7w88fg", "nuc87384v3", "nfu28c8c", "ciubwrivb83bv", "v73h84gv834v", "bibc834bv"]
  task seed_two: :environment do

    Movieswatched.destroy_all
    User.destroy_all
    Subscriptionpayment.destroy_all
    Creditcard.destroy_all
    Address.destroy_all
    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password_digest: BCrypt::Password.create(verysecure.sample), 
        f_name: Faker::Name.first_name,
        l_name:  Faker::Name.last_name,
      )
    end
    p "users added"

    #associating users with subscription plans
    @subtype = {"basic"=> 4.99, "premium" => 9.99}
    year = [2020, 2021, 2022, 2023]
    companies = ["american Express", "mastercard", "visa"]

    @users = User.all 
    @users.each do |user|

      puts sub.inspect
      thekey = @subtype.keys.sample

      Subscriptionpayment.create!(
        users_id: user.id, 
        subscription_level: thekey, 
        price: @subtype[thekey],
      )
        Creditcard.create!(
        users_id: user.id,
        number: Faker::Number.number(12),
        nameoncard: user.f_name + " " + user.l_name,
        expdate: year.sample.to_s + "/" + Faker::Number.between(1,12).to_s,
        organisationtype: companies.sample
      )
      Address.create!(
        users_id: user.id,
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        postcode: Faker::Address.postcode,
      )

    end
  end


    task seed_three: :environment do
      

  end
end

#
#
#
#
#
#where code goes to die

#end
    # statustype = ["shipped", "pending"]
    # total = [5.99, 6.99, 10, 3.99, 7.98, 30, 20, 13.98, 11.98, 50, 23.96]

    # @order = Orders.all 
    # @order.each do |o|
    #   status: statustype.sample

    # end
# @merchidtitle = Hash.new 
# @countryidnames = Hash.new 

# @merch = Merchandise.all
# ct = 0
# @merch.each do |merch|
#   puts merch.id, merch.name 
#   @merchidtitle[merch.name] = merch.id
#   #puts @merchidtitle.inspect
#   ct += 1
#   puts "merch counter#{ct}"
# end 

# @ctrys = Country.all 
# @ctrys.each do |c|
#   puts c.inspect
#   ctry = c.Country
#   @countryidnames[ctry] = c.id
# end

#task seed_two: :environment do

   

    #ActiveRecord::Base.connection.execute("SET session_replication_role = 'origin';")

#     task when_in_doubt: :environment do


#     movie = Movie.select(:id, :productioncountry, :Title)
#     movie.each do |m|        
#       puts m.inspect

#       v = m.Title
#       @ttle = "%" + v.gsub("'", "''").gsub(/\A\p{Space}*|\p{Space}*\z/, '') + "%"  
#       puts @ttle

#       if m.productioncountry == nil || m.productioncountry == 'New Line' || m.productioncountry == 'Official site'
#       sql = <<-SQL 
#       UPDATE movies SET countries_id = null WHERE movies.id = #{m.id}; 
#       SQL
#       ActiveRecord::Base.connection.execute(sql)
#       elsif m.productioncountry == 'Soviet Union'
#         relid1 = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = 'Russia'")
#         sql = <<-SQL 
#         UPDATE movies SET countries_id = #{relid1[0].id} WHERE movies.id = #{m.id}; 
#         SQL
#         ActiveRecord::Base.connection.execute(sql)
#       elsif m.productioncountry == 'West Germany'
#         relid2 = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = 'Germany'")

#         sql = <<-SQL 
#         UPDATE movies SET countries_id = #{relid2[0].id} WHERE movies.id = #{m.id}; 
#         SQL
#         ActiveRecord::Base.connection.execute(sql)

#       else
#       ctrytableid = Country.find_by_sql("SELECT id FROM countries WHERE \"Country\" = '#{m.productioncountry}'")
#       puts ctrytableid[0].id.inspect

#       titlematch = Merchandise.find_by_sql("SELECT id FROM merchandises WHERE name LIKE '#{@ttle}' ")
#       puts titlematch[0].id.inspect
      
#       sql = <<-SQL 
#       UPDATE movies SET countries_id = #{ctrytableid[0].id}, merchandises_id = #{titlematch[0].id}
#       WHERE movies.id = #{m.id}; 
#       SQL
#       ActiveRecord::Base.connection.execute(sql)
#     end
#   end
# end

# end


 #  #array for merch matches
    #  @country_order = []
    #  @merch_order = []
    # @csvarray1.each do |csv| #this caused the loop to go once
    #   @v = csv.to_s
    #   puts "#{@v}"
    #   break unless @merchidtitle.each do |key, value|
    #     count = 0
    #     puts key, value
    #     if @v == key 
    #       @merch_order << value.to_i
    #       #break
    #   end
    #   puts "these are the merch ids: #{@merch_order[count]}"
    #   count += 1
    #  end
    # end

    #this loop breaks but used a simpler solution higher up
    # #array for country matches
    # @csvarray2.each do |csv|
    #   @iv = csv.to_s
    #   break unless @countryidnames.each do |key, value|
    #     count = 0
    #     puts key, value
    #    if @iv == key 
    #       @country_order << value.to_i
    #       break
    #        if key == nil
    #           @country_order << Country.select(:id).where(" \"Country\" = 'Unknown'")
    #          break
    #        end
    #   end
    #   puts @country_order[count]
    #   count += 1
    #  end
    # end




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