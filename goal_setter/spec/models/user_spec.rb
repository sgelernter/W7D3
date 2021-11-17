require 'rails_helper'

RSpec.describe User, type: :model do

    
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
        # it { should validate_length_of(:password) }
    end

    describe "User::find_by_credentials" do 
        it "should return correct user by given credentials" 
        it "should return nil if user if not found"
    end

    describe "#reset_session_token!" do
        it "should assign a new session token to the user"
        it "should return the new session token"
    end

    describe "#is_password?" do 
        it "should use BCrypt to check if given passsword matches password_digest"
    end

    describe "#password_ecription" do
        it "should use BCrypt to generate a password digest"
        it "should save ecrypted password to password_digest"
    end

end