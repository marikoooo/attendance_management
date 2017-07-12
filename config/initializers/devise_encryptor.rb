module Devise
  module Encryptable
    module Encryptors
      class PasswordAuthentification < Base
        def self.digest(password, stretches, salt, pepper)
          password
        end
 
        def self.salt(stretches)
        end
 
        def self.compare(encrypted_password, password, stretches, salt, pepper)
          encrypted_password == password
        end
      end
    end
  end
end