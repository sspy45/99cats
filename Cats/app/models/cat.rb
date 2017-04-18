require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(black white gray),
    message: "%{value} is not a valid color."}
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex."}

  has_many :cat_rental_requests, dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

end
