class Account < ActiveRecord::Base
    validates :studentnumber, presence: true, length: {  maximum: 6 }, uniqueness: true

    has_secure_password
    validates :password, length: {  minimum: 6  }
end
