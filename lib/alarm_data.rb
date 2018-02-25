require 'time' # for Time#parse

class AlarmData
  attr_reader :interval_sec, :start_time_str, :finish_time_str

  def initialize(interval_sec, start_time_str, finish_time_str)
    @interval_sec = interval_sec.to_i
    @start_time_str = start_time_str.to_s.strip
    @finish_time_str = finish_time_str.to_s.strip
  end

  def valid?
    # TODO
    has_error = false
    
    if interval_sec.nil? || interval_sec < 10
      STDERR.puts "invalid interval_sec: #{interval_sec}"
      has_error = true
    end

    unless start_time_str =~ /\A[0-9]+:[0-9]+\z/
      STDERR.puts "invalid start_time_str: #{start_time_str}"
      has_error = true
    end

    unless finish_time_str =~ /\A[0-9]+:[0-9]+\z/
      STDERR.puts "invalid finish_time_str: #{finish_time_str}"
      has_error = true
    end
    
    !has_error
  end

  def to_s
    "interval_sec, start_time_str, finish_time_str = #{interval_sec}, #{start_time_str}, #{finish_time_str}"
  end

  def date_str
    Time.now.strftime("%Y-%m-%d")
  end

  def start_time
    Time.parse(date_str + " " + start_time_str)
  end

  def finish_time
    Time.parse(date_str + " " + finish_time_str)
  end
end
