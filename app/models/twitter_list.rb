class TwitterList < ActiveRecord::Base
	attr_accessible :id, :list_slug, :name, :owner_screen_name, :pod_id
	has_and_belongs_to_many :tweets, :order => 'twitter_created_at DESC'
	has_and_belongs_to_many :members

	belongs_to :pod, :inverse_of => :twitter_list


	def perform 
		Rails.logger.info "DEBUG : Owner : #{owner_screen_name} ..."
		Rails.logger.info "DEBUG : Name : #{name} ..."
		Rails.logger.info "DEBUG : List slug #{list_slug} ..."
		members = nil
		max_attempts = 1
		num_attempts = 0	

		cursor = -1
		user_ids = []
		while cursor != 0 do
			begin
				num_attempts += 1
				members = Twitter.list_members(owner_screen_name, list_slug, { :cursor => cursor })
				user_ids += members.users.collect { |user|  user.id }
				cursor = members.next_cursor
			rescue Twitter::Error::TooManyRequests => error
				if num_attempts <= max_attempts
					# NOTE: Your process could go to sleep for up to 15 minutes but if you
					# retry any sooner, it will almost certainly fail with the same exception.
					Rails.logger.info "DEBUG : Twitter List rate limit reset : #{error.rate_limit.reset_in}"
					sleep error.rate_limit.reset_in
					retry
				else
					raise
				end
			end
			sleep 75
		# end while 
		end	

		# save member
		user_ids.each do |user_id|
			if (!Member.where(:user_id => user_id.to_s).empty?)
				Rails.logger.info "DEBUG : Skipping user : #{user_id}"	
				next
			end

			Rails.logger.info "DEBUG : Saving user : #{user_id}"	

			# new member
			self.members.create!(:user_id => user_id)
			# member = Member.new
			# member.user_id  = user_id
			# member.save
			
			# # save list membership 
			# join = TwitterListMember.new
			# join.member_id = member.id
			# join.twitter_list_id = id
			# join.save
		end

	end
end
