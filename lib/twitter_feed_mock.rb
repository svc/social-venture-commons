class TwitterFeedMock
  def self.search(term)
    yaml = YAML.load_file(File.join(File.dirname(__FILE__),"/twitter_feed_mocks/#{term.gsub(/[^a-z ]/i,'').gsub(/ /,'-')}.yml"))
    Twitter::SearchResultInfo.new_from_hash({'results'=> yaml})
  end
end