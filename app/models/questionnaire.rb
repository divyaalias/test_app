class Questionnaire < ApplicationRecord
	has_one :field
	accepts_nested_attributes_for :field
end
