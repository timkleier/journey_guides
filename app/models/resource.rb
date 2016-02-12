class Resource
  include Mongoid::Document
  
  before_save :make_slug
  
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :stages
  
  field :title
  field :description
  # field :slug
  field :format
  field :source
  field :length
  
  # def make_slug
  #   self.slug = self.title.split(':')[0].parameterize.underscore
  # end
end
