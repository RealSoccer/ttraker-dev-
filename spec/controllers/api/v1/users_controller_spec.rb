require 'spec_helper'

describe Api::V1::UsersController do
  describe :login do
    context :without_api_key do
      it "returns a 401 error" do
        DeveloperApplication.stub!(:exists?).and_return(false)
        post :login, :format => :json
        response.status.should == 401
      end
    end

    context :with_api_key do
      it "returns a 200 success" do
        DeveloperApplication.stub!(:exists?).and_return(true)
        user = FactoryGirl.create(:user)
        User.stub!(:find_by_email).and_return(user)
        user.stub!(:valid_password?).and_return(true)
        request.env['HTTP_AUTHORIZATION'] = "Token token=\"arbitrary_value\""
        post :login, :format => :json
        response.status.should == 200
      end
    end

    context :logins_with_valid_account do
      before :each do
        @user = FactoryGirl.create(:user)
        app = FactoryGirl.create(:developer_application, :user => @user)
        request.env['HTTP_AUTHORIZATION'] = "Token token=\"#{app.api_key}\""
      end

      it "should return a 200 success" do
        post :login, :email => @user.email, :password => 'please', :format => :json
        response.status.should == 200
      end

      it "should return the token for the account logged in" do
        post :login, :email => @user.email, :password => 'please', :format => :json
        token = Token.find_by_user_id(@user.id)
        response.body.should == token.to_json
      end

      it "should update a current token" do
        old_token = Token.create(:user_id => @user.id, :token => SecureRandom::hex(16))
        post :login, :email => @user.email, :password => 'please', :format => :json
        parsed_body = JSON.parse(response.body)
        parsed_body["token"].should_not == old_token.token
      end
    end

    context :logins_with_invalid_account do
      it "should return a 401 unauthorised" do
        user = FactoryGirl.create(:user)
        app = FactoryGirl.create(:developer_application, :user => user)
        request.env['HTTP_AUTHORIZATION'] = "Token token=\"#{app.api_key}\""
        post :login, :email => user.email, :password => 'invalid_password', :format => :json
        response.status.should == 401
      end
    end
  end
end
