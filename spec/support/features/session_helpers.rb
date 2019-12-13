module Features 
    module SessionHelpers 
        def input_movie_title(search)
            visit 'movies/index'
            fill_in 'search', with: search
            click_button "Search"
        end
    end

end