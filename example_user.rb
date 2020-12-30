class User
	attr_accessor :name, :email

	def initialize(attributes = {})
		@name  = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name}, #{@email}"
	end
end

# david = User.new({name: "david", email: "dr.01@aol.com"})
# david1 = User.new({name: "david", email: "dr.01@aol.com"})
# david2 = User.new({name: "david", email: "dr.01@aol.com"})
# david3 = User.new({name: "david", email: "dr.01@aol.com"})

# arr = [david, david1, david2, david3]


# arr.each do |user|
# 	puts user.formatted_email
# end
# # puts david.formatted_email