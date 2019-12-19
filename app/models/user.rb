class User < ApplicationRecord
validates_presence_of :first_name, :last_name, :email, :google_token
validates_uniqueness_of :email

end
