require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user) { User.create(username: 'bob', password_digest: 'aslkdfjalskd', session_token: 'asldjqwoijd') }

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
    # it { should validate_length_of(:password) }
end