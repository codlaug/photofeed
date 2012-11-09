
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'delayed_job'
include Clockwork

handler do |job|
  Rails.logger.info "Running #{job}"
end

every(180.minutes, 'tweet.service.job') { TwitterList.all.each { |tl| Delayed::Job.enqueue tl }} 


