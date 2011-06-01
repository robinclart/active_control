require File.expand_path('../../lib/active_control', __FILE__)
require 'minitest/autorun'

class User
  include ActiveControl::Ability
end

module Admin
  class User
  end
end

class Comment
  include ActiveControl::Authorization

  def authorize_admin_user_to_manage?(user)
    true
  end

  def authorize_user_to_manage?(user)
    user
  end

  def authorize_user_to_destroy?(user)
    false
  end

  def authorize_user_to_read?(user)
    true
  end
end

class TestActiveControl < MiniTest::Unit::TestCase
  def setup
    @user = User.new
    @comment = Comment.new
  end

  def test_can?
    assert @user.can? :manage, @comment
  end

  def test_cannot?
    assert @user.cannot? :destroy, @comment
  end

  def test_authorize?
    assert @comment.authorize?(@user, :read)
  end

  def test_authorize_in_a_namespace
    assert @comment.authorize?(Admin::User.new, :manage)
  end
end
