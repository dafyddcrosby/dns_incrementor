#!/usr/bin/env ruby
# Copyright 2014 Dafydd Crosby
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'time'

file_name = ARGV[0]

begin
  zone = File.read(file_name)
rescue
  puts "Could not read #{file_name}"
  exit
end
if zone =~ /(?<date>20\d\d(0[1-9]|1[0-2])(0[1-9]|1\d|2\d|30|31))(?<num>\d\d)/
  match = Regexp.last_match(0)
  date = Regexp.last_match[:date]
  num = Regexp.last_match[:num]
  today = Time.now.strftime("%Y%m%d")
  new_num = today.to_i > date.to_i ? 0 : num.to_i + 1
  # BUG - overflow possible after 99 iterations
  new_serial = "%s%.2i" % [today, new_num]
  zone.gsub!(match, new_serial)
  begin
    File.open(file_name, 'w') {|file| file << zone}
  rescue
    puts "Could not write to file #{file_name}"
  end
end
