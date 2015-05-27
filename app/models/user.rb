class User
  include MongoMapper::Document

  key :username, String, required: true, :unique => true
  key :password, String, required: true
  
  many :urls

end
