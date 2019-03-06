#!/usr/bin/env ruby

data = File.read("/tmp/file.dat").lines.map(&:chomp).map { |line|
  buf = line.split(//).each_slice(2).to_a.map(&:join).map { |x| x.to_i(16) }
  i = ((buf[0] & 0x3F) << 7) | (buf[1] >> 1)
  if i & 0x1000 > 0
    i |= 0xF000
  end
  q = ((buf[2] & 0x3F) << 7) | (buf[3] >> 1)
  if q & 0x1000 > 0
    q |= 0xF000
  end
  i,q = [i,q].pack("SS").unpack("ss")
  puts "#{i} #{q}"
  # *si = (float)((int16_t)i);
  # *sq = (float)((int16_t)q);
  [i,q]
}

File.open("/tmp/samples.dat", "w") do |f|
  data.each do |d|
    f.write(d.pack("ff"))
  end
end
