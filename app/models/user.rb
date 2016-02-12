class User
    include Mongoid::Document
    
    field :email
    field :first_name
    field :last_name
    field :middle_initial
    field :role
    
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << self.fields.keys
        all.each do |user|
          csv << user.attributes.values
        end
      end
    end
    
end
