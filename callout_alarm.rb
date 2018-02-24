#!/usr/bin/env ruby
#
# Usage: callout_alarm.rb 5 06:05 07:35
#

intervalSec = ARGV[0]
startTimeStr = ARGV[1]
endTimeStr = ARGV[2]

puts intervalSec


# caffeinate -i -d -u -t 10
