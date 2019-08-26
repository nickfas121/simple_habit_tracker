class Habit < ApplicationRecord
  # Direct associations

  has_many   :completions,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
