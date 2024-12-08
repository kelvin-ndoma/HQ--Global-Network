class User < ApplicationRecord

    has_secure_password  # This will add methods like .password and .authenticate

    # Validations
    validates :first_name, :last_name, :email, :city, :country, :date_of_birth, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    validates :date_of_birth, presence: true
  
    # Secure password functionality (password_digest column must exist in the DB)
  end
  