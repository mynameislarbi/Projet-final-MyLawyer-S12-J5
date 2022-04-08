class Firm < ApplicationRecord
    validates :email,
        uniqueness: true, 
        format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end
