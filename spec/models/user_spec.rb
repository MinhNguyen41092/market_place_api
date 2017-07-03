require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it "should respond to params"  do
    expect(@user).to respond_to :email
    expect(@user).to respond_to :password
    expect(@user).to respond_to :password_confirmation

    expect(@user).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }
end
