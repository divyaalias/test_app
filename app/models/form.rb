class Form < ApplicationRecord
	has_many :questionnaires
	accepts_nested_attributes_for :questionnaires, :reject_if => :all_blank
end
