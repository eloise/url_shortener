class Url
  include MongoMapper::Document
  
  URL_BEGIN = "http://abc.ez/"
  LENGTH = 7

  key :short, String
  key :long, String, required: true
  key :visit_counter, Integer, default: 0
  key :user_id, ObjectId
  
  belongs_to :user
  
  def self.shortener
    begin
      short = rand(36**LENGTH).to_s(36).ljust(LENGTH,'0')
      unique = Url.where(short: short).count
    end while unique != 0
    short
  end
  
end
