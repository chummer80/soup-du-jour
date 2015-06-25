class User < ActiveRecord::Base
	attr_accessor :remember_token
	has_secure_password

	validates :email, on: :create,
		presence: true,
		uniqueness: {case_sensitive: false},
		format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, on: :create, 
		presence: true,
		length: {minimum: 6},
		confirmation: true
	validates :zip_code,
		format: {with: /\A(\d{5})?\z/}
	validate :remove_blank_interests
	validate :remove_blank_morsels

	def remove_blank_interests
		interests.each do |interest|
			if interest.class != String
				errors.add(:interests, "must be strings") 
			else
				interest.strip!
				if interest.length == 0
					interests.delete(interest)
				end
			end
		end
	end

	def remove_blank_morsels
		morsels.each do |morsel|
			if morsel.class != String
				errors.add(:morsels, "must be strings") 
			else
				morsel.strip!
				if morsel.length == 0
					morsels.delete(morsel)
				end
			end
		end
	end

	# Returns the hash digest of the given string.
	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

  	# Use this to give user a different remember token every time they log in
	def self.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
  		self.remember_token = User.new_token
 		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Forgets a user.
	def forget
  		update_attribute(:remember_digest, nil)
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
  		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
end
