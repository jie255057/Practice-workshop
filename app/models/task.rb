class Task < ApplicationRecord
  include AASM

  validates :title, :content, presence: true

  aasm do
    state :todo, initial: true
    state :doing, :complete

    event :start do
      transitions from: :todo, to: :doing
    end

    event :done do
      transitions from: :doing, to: :complete
    end
  end
end
