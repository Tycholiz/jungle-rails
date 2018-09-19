require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should create a user" do
      user = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      expect(user).to be_valid
    end

    it "should not save if passwords don't match" do
      user = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "123456"
      )
      expect(user).to_not be_equal(user.password_confirmation)
    end

    it "should not save without a unique email" do
      user1 = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      user2 = User.create(
        first_name: "Joe",
        last_name: "Jax",
        email: "joe.jacobson@GMAIL.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      expect(user2).to_not be_valid
    end

    it "should not save if first name is not valid" do
      user = User.create(
        first_name: nil,
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      expect(user).to_not be_valid
    end

    it "should not save if last name is not valid" do
      user = User.create(
        first_name: "Joe",
        last_name: nil,
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      expect(user).to_not be_valid
    end

    it "should not save if email is not valid" do
      user = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: nil,
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      expect(user).to_not be_valid
    end

    it "should not save if password is less than 6 characters" do
      user = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asd",
        password_confirmation: "asd"
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should not pass without authenticated credentials" do
      user = User.create(
        first_name: "Joe",
        last_name: "Jacobson",
        email: "joe.jacobson@gmail.com",
        password: "asdasd",
        password_confirmation: "asdasd"
      )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to_not be_valid
    end
  end
end
