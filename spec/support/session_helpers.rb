require 'rails_helper'

module Features
  module SessionHelpers
    def sign_in
      @user = create(:admin_user)
      login
    end

    def regular_sign_in
      @user = create(:user)
      login
    end

    def login
      visit '/users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      expect(page).to have_content(@user.email)
      @user
    end

    def sign_in_as(user)
      sign_out if @user
      @user = user
      login
    end

    # Sign out currently signed-in user through the UI
    def sign_out
      find('.navbar-right .dropdown-toggle').click
      click_link 'Log Out'
      @user = nil
    end
  end
end

module Requests
  module SessionHelpers
    include Warden::Test::Helpers

    def self.included(base)
      base.before(:each) { Warden.test_mode! }
      base.after(:each) { Warden.test_reset! }
    end

    def sign_in(resource)
      login_as(resource, scope: warden_scope(resource))
    end

    def sign_out(resource)
      logout(warden_scope(resource))
    end

    private

    def warden_scope(resource)
      resource.class.name.underscore.to_sym
    end
  end
end
