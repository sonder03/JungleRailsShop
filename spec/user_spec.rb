require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'user has first_name' do
      @user = User.create(first_name: nil, last_name: nil, email: 'user@gmail.com', password: '1111111', password_confirmation: '1111111')
      expect(@user).not_to be_valid
    end

    it 'user has password' do
      @user = User.create(first_name: 'user2', email: 'user2@gmail.com', password: nil)
      expect(@user).not_to be_valid
    end

    it 'the user has password_confirmation with nil' do
      @user = User.create(first_name: 'user3', email: 'user3@gmail.com', password_confirmation: nil)
      expect(@user).not_to be_valid
    end

    it 'the user has not matched password and password_confirmation' do
      @user = User.create(first_name: 'user4', email: 'user4@gmail.com', password: '1111111', password_confirmation: '11111117')
      expect(@user).not_to be_valid
    end

    it 'is invalid if the same email has been used' do
      @user1 = User.create(first_name: 'user5',last_name: 'user5', email: 'user5@gmail.com', password: '1111111')
      @user2 = User.create(first_name: 'user5', last_name: 'user5',email: 'user5@gmail.com', password: '1111111')
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

    it 'is valid if the different email' do
      @user1 = User.create(first_name: 'user5',last_name: 'user5', email: 'user5@gmail.com', password: '1111111')
      @user2 = User.create(first_name: 'user5',last_name: 'user5', email: 'user6@gmail.com', password: '1111111')
      expect(@user1).to be_valid
      expect(@user2).to be_valid
    end

    # Email and first_name should also be required
    it 'is invalid if no first_name' do
      @user = User.create(email: 'user7@gmail.com', password: '1111111', password_confirmation: '1111111')
      expect(@user).not_to be_valid
    end

    it 'is invalid if no email' do
      @user = User.create(first_name: 'user7', password: '1111111', password_confirmation: '1111111')
      expect(@user).not_to be_valid
    end

    # Password minimum length
    it 'is invalid if password length is too short' do
      @user = User.create(first_name: 'user7', email: 'user7@gmail.com', password: '12', password_confirmation: '12')
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'return nil if password is wrong' do
      @user = User.create(first_name: 'user', email: 'user@gmail.com', password: '1111111', password_confirmation: '1111111')

      auth_user = User.authenticate_with_credentials("user@gmail.com", "222333")
      expect(auth_user).to be_nil
    end



  end
end