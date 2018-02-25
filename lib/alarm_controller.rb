class AlarmController
  attr_accessor :data, :state, :speech_queue, :caffeinate_pid
  
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

  def set_active
    @state = :active
  end

  def set_inactive
    @state = :inactive
  end

  def start
    while true
      if data.active_stage?
        if inactive? 
          set_active
          on_start_active
        end
        on_active
      else
        if active?
          set_inactive
          on_start_inactive
        end
      end

      sleep 1
    end
  end

  def log(msg)
    STDERR.puts current_hh_mm + " " + msg
  end

  def on_start_active
    log "on_start_active"
    
    say "おはようございます。"
    start_caffeinate
    make_speech_queue
  end

  def on_active
    log "on_active"
    
    if speech_queue.first[:t] == current_hh_mm
      line = speech_queue.pop
      say line[:message]
    end
  end

  def on_start_inactive
    log "on_start_inactive"
    
    kill_caffeinate
  end

  def start_caffeinate
    cmd = "caffeinate -i -d -u -t #{data.active_time_span_sec}"
    puts cmd
    @caffeinate_pid = fork do
      # exec cmd
    end
  end

  def kill_caffeinate
    # Process.kill(:TERM, @caffeinate_pid)
    @caffeinate_pid = nil
  end

  def current_hh_mm
    Time.now.strftime('%H:%M')
  end

  def say(str)
    `say -v Kyoko "#{str}"`
  end
  
  def natural_timestr(t)
    minutes = t.strftime("%M").sub(/^0/, '')
    hours = t.strftime("%H").sub(/^0/, '')
    "時刻は#{hours}時#{minutes}分です。"    
  end

  def make_speech_queue
    @speech_queue = []
    t = data.start_time.clone
    while t <= data.finish_time
      timestr = t.strftime("%H:%M")
      message = natural_timestr(t)
      @speech_queue.push({ t: timestr, message: message })
      t += data.interval_sec
    end
  end
end
