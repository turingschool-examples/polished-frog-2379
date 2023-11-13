class Hospital < ApplicationRecord
  has_many :doctors, dependent: :destroy
end