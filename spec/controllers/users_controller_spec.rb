require 'spec_helper'

describe UsersController do

  describe "Get 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      # the :user symbol below is the actual @user in the users_controller
      assigns(:user).should == @user
    end
        
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name )
    end
  
    it "should have the users name" do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.name)
    end
    
    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => "gravatar")
    end
    
    it "should have the right URL" do
      get :show, :id => @user
      response.should have_selector('td>a', :content => user_path(@user), 
                                            :href => user_path(@user))
    end
    
  
  end



  describe "GET 'new'" do    
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    # it "should have the right title" do
      # get :new
      # response.should have_selector('title', :content => "Sign up")
    # end    
    
  end









end
