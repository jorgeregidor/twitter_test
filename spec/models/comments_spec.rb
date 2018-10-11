require "rails_helper"

RSpec.describe Comment do
	
	describe "Comments model" do

		describe "body" do

			before(:each) do
 				@comment = Comment.new
		  	@user = User.create!(email: "user@email.com", password: "123456", password_confirmation: "123456", nick: "user")
		  	@comment.user_id = @user.id
  		end

			it "validates_presence_of" do
		  	@comment.valid?
		  	expect(@comment.errors.keys).to eq([:body])
		  end

		  it "validates bigger dan 0 characteres" do
		  	@comment.body = ""
		  	@comment.valid?
		  	expect(@comment.errors.keys).to eq([:body])
		  end

		  it "validates less dan 141 characteres" do
		  	@comment.body = "012345678901234567890123456789012345678901234567890123456789012345678901234567890123456798012345678901234567890123456789012345678901236456789"
		  	@comment.valid?
		  	expect(@comment.errors.keys).to eq([:body])
		  end
		  
		end

		describe "relations" do

			before(:each) do
		  	@user = User.create!(email: "user@email.com", password: "123456", password_confirmation: "123456", nick: "user")
		  	@comment1 = Comment.create!(body: "comment1", user_id: @user.id)
		  	@comment2 = Comment.create!(body: "comment2", user_id: @user.id, parent_id: @comment1.id)
  		end

			it "validates names" do
		  	expect(@comment2.parent).to eq(@comment1)
		  	expect(@comment1.answers).to eq([@comment2])
		  end
		end

		describe "user" do

			it "validates_presence_of" do
				@comment = Comment.new
				@comment.body = "hello world"
		  	@comment.valid?
		  	expect(@comment.errors.keys).to eq([:user])
		  end
		end


		describe "all" do

			it "right" do
				@user = User.create!(email: "user@email.com", password: "123456", password_confirmation: "123456", nick: "user")
		  	@comment = Comment.create!(body: "comment1", user_id: @user.id)
		  	@comment.valid?
		  	expect(@comment.valid?).to eq(true)
		  end
		end

	end
end