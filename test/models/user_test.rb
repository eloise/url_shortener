require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "validate presence of username" do
    user = User.new password: "testing"
    assert_not user.valid?
    user.username = 'user123'
    assert user.valid?
  end
end
