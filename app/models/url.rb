class Url
  include MongoMapper::Document
  
  LENGTH = 7

  key :short, String
  key :long, String, required: true
  key :visit_counter, Integer, default: 0
  key :user_id, ObjectId
  
  belongs_to :user
  
  def complete_short_url(protocol, host)
    protocol + host + "/" + self.short  
  end
  
  def self.shortener
    begin
      short = rand(36**LENGTH).to_s(36).ljust(LENGTH,'0')
      unique = Url.where(short: short).count
    end while unique != 0
    short
  end
  
end
