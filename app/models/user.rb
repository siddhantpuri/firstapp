class User < ActiveRecord::Base
	SUCCESS = 1
	ERR_BAD_CREDENTIALS = -1
	ERR_USER_EXISTS = -2
	ERR_BAD_USERNAME = -3
	ERR_BAD_PASSWORD = -4

	validates :user, presence: true, length: { maximum: 128 }, uniqueness: { case_sensitive: false }
	validates :password, length: { maximum: 128 }

	before_save { self.user = user.downcase }

	def login(name, password)
		user = Users.find_by user(name)
		if name==nil
			return ERR_BAD_CREDENTIALS
		end
		if user.password == password
			user.count += 1
		end
		user.save
		return user.count
		return ERR_BAD_CREDENTIALS
	end

	def add(name, password)
		user = Users.find_by user(name)
		if name.blank?
			return ERR_BAD_USERNAME
		end

		user.count = 1
		user.save
		return user.count
	end

	def reset()
		connection = ActiveRecord::Base.connection
    ActiveRecord::Base.connection.execute("DELETE FROM users")
		return 1
	end

end