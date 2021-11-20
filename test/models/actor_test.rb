require 'test_helper'

class ActorTest < ActiveSupport::TestCase
  test "invalid without name" do
     actor = Actor.new()
     refute actor.valid?, 'user is valid without a name'
     assert_not_nil actor.errors[:name], 'no validation error for name present'
  end
end
