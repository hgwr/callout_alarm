class AlarmController
  attr_accessor :data, :state, :speech_queue
  
  def initialize(data)
    @data = data
    @state = :inactive
    @speech_queue = []
  end

  def active?
    state == :active
  end

  def inactive?
    state == :inactive
  end

  def start
    while true
      if data.active_stage?
        if inactive? 
          state = :active
          on_start_active
        end
        on_active
      else
        if !data.active_stage?
          state = :inactive
          on_start_inactive
        end        
      end

      sleep 1
    end
  end

  def on_start_active
    make_speech_queue
  end

  def on_active
  end

  def on_start_inactive
  end

  def make_speech_queue
    @speech_queue = []
    t = data.start_time
    while t < data.finish_time
      timestr = t.strftime("%H:%M")
      minutes = t.strftime("%M").sub(/^0/, '')
      hours = t.strftime("%H").sub(/^0/, '')
      message = "時刻は#{hours}時#{minutes}分です。"
      @speech_queue.push({ t: timestr, message: message })
      t += data.interval_sec
    end
  end
end
