require 'rubygems'
require 'hoe'

Hoe.new('sishen-hbase-ruby', '0.5.0') do |p|
  p.rubyforge_name = 'sishen-hbase-ruby'
  p.author = 'Ye Dingding'
  p.email = 'yedingding@gmail.com'
  p.url = 'http://sishen.lifegoo.com'
  p.summary = 'a pure ruby client for hbase using REST interface'
  p.description = 'hbase-ruby is a pure ruby client for hbase and enable the ruby app enjoy the power of HBase'
end

Dir['tasks/**/*.rake'].each { |rake| load rake }
