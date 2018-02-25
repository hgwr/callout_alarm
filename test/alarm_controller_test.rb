require 'test/unit'
require File.expand_path('../../lib/alarm_data', __FILE__)
require File.expand_path('../../lib/alarm_controller', __FILE__)

class AlarmControllerTest < Test::Unit::TestCase
  def test_make_speech_queue
    data = AlarmData.new("300", "06:05", "07:35")
    controller = AlarmController.new(data)

    controller.make_speech_queue
    
    assert_equal 18, controller.speech_queue.length

    assert_equal({:t=>"06:05", :message=>"時刻は6時5分です。"},
                 controller.speech_queue[0])
    assert_equal({:t=>"06:10", :message=>"時刻は6時10分です。"},
                 controller.speech_queue[1])
    assert_equal({:t=>"07:30", :message=>"時刻は7時30分です。"},
                 controller.speech_queue[17])
  end
end
