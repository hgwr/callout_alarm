require 'test/unit'
require File.expand_path('../../lib/alarm_data', __FILE__)

class AlarmDataTest < Test::Unit::TestCase
  def test_valid?
    data = AlarmData.new("300", "06:05", "07:35")
    assert data.valid?

    data = AlarmData.new("a", "06:05", "07:35")
    assert !data.valid?
  end

  def test_start_time
    data = AlarmData.new("300", "06:05", "07:35")
    
    assert_equal "06:05", data.start_time.strftime("%H:%M")
  end

  def test_finish_time
    data = AlarmData.new("300", "06:05", "07:35")
    
    assert_equal "07:35", data.finish_time.strftime("%H:%M")
  end
end
