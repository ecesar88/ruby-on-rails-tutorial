# frozen_string_literal: true

# comment
class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  VALID_STATUSES = %w[public archived private].freeze

  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
end
