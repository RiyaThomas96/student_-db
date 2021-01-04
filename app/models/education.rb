class Education < ApplicationRecord
  belongs_to :student
  belongs_to :credential
end
