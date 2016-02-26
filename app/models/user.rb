class User
  include Mongoid::Document
  
  belongs_to :stage
  
  field :email
  field :first_name
  field :last_name
  field :middle_initial
  field :role
  field :friend_ids, type: Array, default: []

  # construct name
  def name
    "#{first_name} #{middle_initial} #{last_name}"
  end

  # get friends of user
  def friends
    User.in(:id => friend_ids).all
  end

  # add friend to user
  def add_friend!(user_id)
    self.friend_ids << user_id
    self.save!
  end
  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << self.fields.keys
      all.each do |user|
        csv << user.attributes.values
      end
    end
  end
    
end
