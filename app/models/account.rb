class Account < ActiveRecord::Base
  has_one :account_type
  
  has_many :messages
    
  concerned_with :authorization  
  
  def self.with_message_counts(options ={:limit=>5})
    Account.find_by_sql("SELECT a.*, count(m.id) as message_count FROM accounts a, messages m WHERE a.id = m.account_id GROUP BY a.id ORDER BY message_count DESC limit #{options[:limit]}")
  end
  
  def to_param
    screen_name
  end
  
  def ventures(options ={:limit=>5})
		messages.collect {|m| m.ventures}.flatten.uniq[0...options[:limit]]
  end
  
  def needs(options ={:limit=>5})
    messages.collect {|m| m.needs}.flatten.uniq[0...options[:limit]]
  end
end

