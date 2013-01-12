class Tweet < InterwebPost
  has_and_belongs_to_many :twitter_lists

  def url
    "http://www.twitter.com/#!/#{username}/status/#{twitter_id}"
  end
end