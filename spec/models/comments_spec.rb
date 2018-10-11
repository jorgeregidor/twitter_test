require "rails_helper"

RSpec.describe Comment do
	
	describe "Comments model" do

		describe "title" do

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

	end
end