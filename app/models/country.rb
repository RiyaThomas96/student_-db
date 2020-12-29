class Country < ApplicationRecord
    has_many :institutions
    has_many :students
end
