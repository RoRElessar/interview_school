class Subject < ApplicationRecord
  has_many :subject_teachers, dependent: :destroy
  has_many :teachers, through: :subject_teachers
  accepts_nested_attributes_for :subject_teachers, allow_destroy: true

  validates :name, presence: true
end
