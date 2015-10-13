class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers
  validates_presence_of :question_content
end
