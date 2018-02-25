class AlarmData
  attr_accessor :interval_sec, :start_time_str, :end_time_str

  def initialize(interval_sec, start_time_str, end_time_str)
    @interval_sec = interval_sec.to_s.strip
    @start_time_str = start_time_str.to_s.strip
    @end_time_str = end_time_str.to_s.strip
  end

  def valid?
    # TODO
    has_error = false
    
    unless interval_sec =~ /\A[0-9]+\z/
      STDERR.puts "invalid interval_sec: #{interval_sec}"
      has_error = true
    end

    unless start_time_str =~ /\A[0-9]+:[0-9]+\z/
      STDERR.puts "invalid start_time_str: #{start_time_str}"
      has_error = true
    end

    unless end_time_str =~ /\A[0-9]+:[0-9]+\z/
      STDERR.puts "invalid end_time_str: #{end_time_str}"
      has_error = true
    end
    
    !has_error
  end

  def to_s
    "interval_sec, start_time_str, end_time_str = #{interval_sec}, #{start_time_str}, #{end_time_str}"
  end
end
