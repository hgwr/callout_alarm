class AlarmController
  attr_accessor :data, :state
  
  def initialize(data)
    @data = data
    @state = :inactive
  end

  def active?
    state == :active
  end

  def inactive?
    state == :inactive
  end

  def start
    state = :inactive
    on_start

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

  def on_start
  end

  def on_start_active
  end

  def on_active
  end

  def on_start_inactive
  end
end
