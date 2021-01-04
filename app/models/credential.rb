class Credential < ApplicationRecord
    has_many :educations
    has_many :students, through: :assignments
end
