class Stage
  include Mongoid::Document
  include Mongoid::Tree
  include Mongoid::Tree::Traversal
  
  belongs_to :framework
  has_and_belongs_to_many :resources
  has_many :users
  
  accepts_nested_attributes_for :framework
  accepts_nested_attributes_for :resources
  
  field :title, type: String
  
end
