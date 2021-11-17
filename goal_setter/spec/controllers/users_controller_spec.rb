require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "renders users on the index page" do 
            get :index
            expect(response).to render_template(:index)
        end
    end




end