class Questionnaire < ApplicationRecord
	attr_accessor :option
	serialize :fields, Hash
end
