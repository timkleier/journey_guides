class Resource
  include Mongoid::Document
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :stages
  
  field :title
  field :description
  field :format
  field :source
  field :length
  
end
