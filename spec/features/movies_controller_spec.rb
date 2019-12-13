require "spec_helper"
require "rails_helper"

feature 'search movies' do  
    scenario 'input text in form' do  
        input_movie_title('avatar') 
        expect(page).to have_content('Avatar')  
    end
end


# RSpec.describe 'search movies in index', type: :feature do  
#     scenario 'valid inputs' do  
#         visit movies_index_path 
#         fill_in 'search', with: 'avatar'
#         click_on 'Search' 
#         visit 'movies_path'
#         expect(page).to have_content('Avatar')
#     end  
# end


# describe MoviesController do

#     describe 'GET #index' do
#         context './log_in' do 
#             with :user 
#             before do  
#                 sign_in user
#                 get :index  
#         end
#         it {is_expected.to respond_with :ok}
#         it {is_expected.to respond_with_content_type :html}
#         it {is_expected.to render_with_layout :application}
#         it {is_expected.to render_template :index}

#         end

#         context './logged_out' do  
#             before do  
#                 get :index 
#         end 
#         it {is_expected.to redirect_to new_session_path}

        

#     end

# end 