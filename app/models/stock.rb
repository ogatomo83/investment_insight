class Stock < ApplicationRecord
  has_many :financial_reports
  # Association
  belongs_to :user

  # Validation
  validates :user_id, presence: true
  validates :ticker_symbol, presence: true, uniqueness: { scope: :user_id }
end
