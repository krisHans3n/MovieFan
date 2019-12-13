# README for the MovieFan > #
Ruby 2.5.1  Rails 6.0.1 (this should be correct for your version)
A live version is deployed on Heroku, and can be accessed using the following link:
https://obscure-bastion-44233.herokuapp.com/
You can use these account details to log in 
Admin - admin@admin.com/123456
Normal user - bob@mail.com/123456



## running the application locally ##
Run bundle install If the postgres database isn't already present.
To create the pg database:
rake db:create
To migrate run:
rake db:migrate
Then seed the database using:
rake filltables:seed_one 


## These are the parts that are not working correctly ##



I tried to integrate clickable form for the map in /views/movies/index.html.erb by creating a on click action tied to a popup form.

Testing was attempted at './spec' directory although this proved difficult to overcome finding fields that Capybara could not find. I kept the directory as evidence of attempted testing. Most of my features were built with branches so that, if the application broke and unrecoverable, the branch was destroyed.

