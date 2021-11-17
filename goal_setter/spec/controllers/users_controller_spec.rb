require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "renders users on the index page" do 
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it "renders user for given id" do 
            get :show
            expect(response).to render_template(:show)
        end
    end

    describe "GET #new" do
        it "should show sign up form" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "GET #edit" do
        it "should show user edit form" do
            get :edit
            expect(response).to render_template(:edit)
        end
    end

    describe "POST #create" do
        
        context "with valid user info" do
            # before :each do
            #     create(:user)
            # end
            let(:params){{user:{username: "tim", password: "hunter12"}}}
            it "should save user to database" do
                post :create, params
                expect(User.last.username).to eq("tim")
            end

            it "should log user in"
            it "should show that user page"
        end

        context "with invalid user info" do
            it "should display new user signup form"
        end
    end

    describe "PATCH #update" do

    end

    describe "DELETE #destroy" do

    end

end