require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "renders users on the index page" do 
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        testboy = User.create(username: Faker::Name.name, password: 'testing')
        it "renders user for given id" do 
            get :show, {params: {id: testboy.id}} 
            expect(response).to redirect_to(user_url(testboy.id))
        end
    end

    describe "GET #new" do
        it "should show sign up form" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "GET #edit" do
        testboy = User.create(username: Faker::Name.name, password: 'testing')
        it "should show user edit form" do
            get :edit, {params: {id: testboy.id}} 
            expect(response).to redirect_to(edit_user_url(testboy.id))
        end
    end

    describe "POST #create" do
        
        context "with valid user info" do
            it "should save user to database" do
                random_name = Faker::Name.name
                post :create, {params: {username: random_name, password: 'testing'}}
                expect(User.find_by(username: random_name)).to_not be nil 
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