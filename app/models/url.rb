class Url
  include MongoMapper::Document

  key :short, String
  key :long, String, required: true
  key :visit_counter, Integer, default: 0
  key :user_id, ObjectId
  
  belongs_to :user

end
