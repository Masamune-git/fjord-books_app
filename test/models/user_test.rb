# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)

    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test '#following?' do
    Relationship.create!(following_id: @bob.id, follower_id: @alice.id)
    assert @alice.following?(@bob)
    assert_not @bob.following?(@alice)
  end

  test '#followed_by?' do
    Relationship.create!(following_id: @bob.id, follower_id: @alice.id)
    assert @bob.followed_by?(@alice)
    assert_not @alice.followed_by?(@bob)
  end

  test '#self.from_omniauth' do
    user = User.from_omniauth(github_mock)
    assert_equal 'hoge', user.name
    assert_equal 'hoge@example.com', user.email
    assert_equal 20, user.password.length
  end
end
