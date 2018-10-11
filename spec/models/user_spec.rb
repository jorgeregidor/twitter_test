require "rails_helper"

RSpec.describe User do
	
	describe "User model" do

		describe "nick" do

			it "validates_presence_of" do
				@user = User.new(email: "user@email.com", password: "123456", password_confirmation: "123456")
		  	@user.valid?
		  	expect(@user.errors.keys).to eq([:nick])
		  end

		  it "validates_uniqueness_of" do
		  	@user1 = User.create!(email: "user1@email.com", password: "123456", password_confirmation: "123456", nick:"user")
		  	@user2 = User.new(email: "user2@email.com", password: "123456", password_confirmation: "123456", nick:"user")
		  	@user2.valid?
		  	expect(@user2.errors.keys).to eq([:nick])
		  end

		  
		end

		describe "email" do

			it "validates_presence_of" do
				@user = User.new(password: "123456", password_confirmation: "123456", nick: "user")
		  	@user.valid?
		  	expect(@user.errors.keys).to eq([:email])
		  end

		  it "validates_uniqueness_of" do
		  	@user1 = User.create!(email: "user@email.com", password: "123456", password_confirmation: "123456", nick:"user1")
		  	@user2 = User.new(email: "user@email.com", password: "123456", password_confirmation: "123456", nick:"user2")
		  	@user2.valid?
		  	expect(@user2.errors.keys).to eq([:email])
		  end

		end

		describe "password" do

			it "validates pa" do
				@user = User.new(email: "user@email.com", password: "12345", password_confirmation: "12345", nick: "user")
		  	@user.valid?
		  	expect(@user.errors.keys).to eq([:password])
		  end

		end

		describe "all" do

			it "right" do
				@user = User.new(email: "user@email.com", password: "123456", password_confirmation: "123456", nick: "user")
		  	expect(@user.valid?).to eq(true)
		  end

		end
		

	end
end