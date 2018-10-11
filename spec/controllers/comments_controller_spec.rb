require "rails_helper"

RSpec.describe CommentsController do
	
	describe "Comments Controller" do

  	describe "logged" do

			before(:each) do
 				@user = User.create!(email: "user@email.com", password: "123456", password_confirmation: "123456", nick: "user")
		  	@comment = Comment.create!(body: "comment1", user_id: @user.id)
		    sign_in(@user)
  		end
  		
  		describe "GET index" do

		    it "renders the index template" do
		      get :index
		      expect(response).to render_template(:index)
		    end

		    it "validate response" do
		      get :index
		      expect(assigns(:comments)).to eq([@comment])
		      expect(assigns(:new_comment)).to be_a_new(Comment)
		    end

		     it "validate order created_at desc" do
		      get :index
		      @comment2 = Comment.create!(body: "comment2", user_id: @user.id)
		      expect(assigns(:comments)).to eq([@comment2, @comment])
		    end

		  end

		  describe "GET show" do


				before(:each) do
			  	@comment2 = Comment.create!(body: "comment1", user_id: @user.id, parent_id: @comment.id)
	  		end

		    it "renders the show template" do
		      get :show, params: {id: @comment.id}
		      expect(response).to render_template(:show)
		    end

		    it "validate response" do
		      get :show, params: {id: @comment.id}
		      expect(assigns(:comment)).to eq(@comment)
		      expect(assigns(:new_comment)).to be_a_new(Comment)
		      expect(assigns(:comments)).to eq([@comment2])
		    end

		     it "validate order created_at desc" do
		     	@comment3 = Comment.create!(body: "comment3", user_id: @user.id, parent_id: @comment.id)
		      get :show, params: {id: @comment.id}
		      expect(assigns(:comments)).to eq([@comment3, @comment2])
		    end

		  end

		  describe "POST create" do

		  	it "redirect the index template OK" do
		      post :create ,params: {comment: {body: "body", user_id: @user.id}}
		      expect(response).to redirect_to root_url
		    end


		    it "redirect the show template" do
		      post :create ,params: {comment: {body: "body", user_id: @user.id, parent_id: @comment.id}}
		      expect(response).to redirect_to comment_url(@comment.id)
		    end


		  end

		end

		describe "Not logged" do
			
			it "index redirect to login" do
		     get :index
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "index redirect to login" do
		     get :show, params: {id: 1}
		     expect(response).to redirect_to new_user_session_path
		  end

		  it "index redirect to login" do
		     post :create
		     expect(response).to redirect_to new_user_session_path
		  end


		end

	end
end