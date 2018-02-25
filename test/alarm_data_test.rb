require 'test/unit'
require File.expand_path('../../lib/alarm_data', __FILE__)

class AlarmDataTest < Test::Unit::TestCase
  def test_valid?
    data = AlarmData.new("5", "06:05", "07:35")
    assert data.valid?

    data = AlarmData.new("a", "06:05", "07:35")
    assert !data.valid?
  end
end
