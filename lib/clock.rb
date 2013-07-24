
require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'delayed_job'
include Clockwork

every(90.minutes, 'member.tweet.job') { Member.all.each { |member| Delayed::Job.enqueue member }}
every(240.minutes, 'twitter.list.job') { TwitterList.all.each { |tl| Delayed::Job.enqueue tl }}
every(30.minutes, 'instagram.job') { InstagramAccount.all.each { |instagram| Delayed::Job.enqueue instagram }}

