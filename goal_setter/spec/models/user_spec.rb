require 'rails_helper'

RSpec.describe User, type: :model do

    subject(:user_2) { User.create(username: 'tom', password: 'hunter12') }
    
    describe "Presence" do
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_presence_of(:session_token) }
    end

    describe "Uniqueness" do
        before :each do 
            create(:user)
        end
        it { should validate_uniqueness_of(:username) }
        it { should validate_uniqueness_of(:session_token) }
        it { should validate_length_of(:password) }
    end

    describe "User::find_by_credentials" do 
        it "should return correct user by given credentials" do 
            tom = user_2
            expect(User.find_by_credentials('tom', 'hunter12')).to eq(tom)
        end
        
        it "should return nil if user if not found" do 
            expect(User.find_by_credentials('tom', '')).to be nil 
        end
    end

    describe "#reset_session_token!" do
    it "should assign a new session token to the user" do
            old_token = user_2.session_token
            user_2.reset_session_token!
            expect(user_2.session_token).to_not eq(old_token)
        end

        it "should return the new session token" do
            new_token = user_2.reset_session_token!
            expect(user_2.session_token).to eq(new_token)
        end

    end

    describe "#is_password?()" do 
        it "should use BCrypt to check if given passsword matches password_digest" do 
            expect(BCrypt::Password.new(user_2.password_digest).is_password?('hunter12')).to be true
        end
    end
    
    describe "#password=" do

        it "should use BCrypt to generate a password_digest" do
            expect(BCrypt::Password).to receive(:create).with('hello')
            User.create(username: 'bob', password: 'hello')
        end
    end

end