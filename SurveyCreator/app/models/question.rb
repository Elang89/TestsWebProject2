class Question < ActiveRecord::Base
  belongs_to :survey
  has_one :answer, dependent: :destroy

  accepts_nested_attributes_for :answer
  validates_presence_of :question_content
end
