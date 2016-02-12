class Framework
  include Mongoid::Document
  
  has_many :stages
  
  field :title, type: String
  
end
