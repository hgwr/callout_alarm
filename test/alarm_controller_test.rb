require 'test/unit'
require File.expand_path('../../lib/alarm_data', __FILE__)
require File.expand_path('../../lib/alarm_controller', __FILE__)

class AlarmControllerTest < Test::Unit::TestCase
  def test_valid?
    data = AlarmData.new("5", "06:05", "07:35")
    controller = AlarmController.new(data)
    assert controller
  end
end
