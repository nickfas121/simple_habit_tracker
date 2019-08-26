class Completion < ApplicationRecord
  # Direct associations

  belongs_to :habit

  belongs_to :user

  # Indirect associations

  # Validations

end
