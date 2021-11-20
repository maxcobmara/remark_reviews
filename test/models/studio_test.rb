require 'test_helper'

class StudioTest < ActiveSupport::TestCase
  test "invalid without country" do
     studio = Studio.new(name: 'Pinewood')
     refute studio.valid?, 'studio is valid without a country'
     assert_not_nil studio.errors[:country], 'no validation error for lack of coountry present'
  end
end
