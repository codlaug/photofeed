
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'delayed_job'
include Clockwork

handler do |job|
  puts "Running #{job}"
end

#every(10.seconds, 'tweet.service.job') { TwitterList.all.each { |tl| tl.get_new_tweets } } 
every(90.minutes, 'tweet.service.job') { TwitterList.all.each { |tl| Delayed::Job.enqueue tl }} 


