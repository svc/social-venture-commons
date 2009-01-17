class TwitterFeed
  def self.search(term)
    Twitter::Search.new(term).fetch()
  end
end