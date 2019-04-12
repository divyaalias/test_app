class Form < ApplicationRecord
	attr_accessor :query

	belongs_to :user
	has_many :questionnaires, dependent: :destroy

	accepts_nested_attributes_for :questionnaires, :reject_if => :all_blank

	serialize :answers, Array
end
