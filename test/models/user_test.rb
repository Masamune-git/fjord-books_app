# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "#name_or_email" do  
    user = User.new(email: "foo@example.com", name: "")
    assert_equal "foo@example.com", user.name_or_email
    user.name = "Foo Bar"
    assert_equal "Foo Bar", user.name_or_email
  end

  test "#follow" do  
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test "#unfollow" do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
    
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end

  test "#following?" do  
    Relationship.create!(following_id: @she.id, follower_id: @me.id)
    assert @me.following?(@she)
  end

  test "#followed_by?" do  
    Relationship.create!(following_id: @she.id, follower_id: @me.id)
    assert @she.followed_by?(@me)
  end

  test "#self.from_omniauth" do
    user = User.from_omniauth(github_mock)      
    assert_equal "hoge", user.name
    assert_equal "hoge@example.com", user.email
    assert user.password.present?
  end
end
