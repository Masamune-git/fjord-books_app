# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#name_or_email" do
    user = User.new(email: "foo@example.com", name: "")
    assert_equal "foo@example.com", user.name_or_email

    user.name = "Foo Bar"
    assert_equal "Foo Bar", user.name_or_email
  end

  # test "#unfollow" do
  #   user = User.new(email: "foo@example.com", name: "")
  #   assert_equal "foo@example.com", user.name_or_email

  #   user = User.new(email: "hoge@example.com", name: "hoge")
  #   assert_equal "hoge", user.unfollow(user)
  # end

end
