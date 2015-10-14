class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :results

  validates_presence_of :name
  accepts_nested_attributes_for :questions
end
