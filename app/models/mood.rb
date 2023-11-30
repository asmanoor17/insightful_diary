class Mood < ApplicationRecord
  belongs_to :users
  belongs_to :journals
end
