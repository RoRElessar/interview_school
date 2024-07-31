class Teacher < ApplicationRecord
  has_many :subject_teachers, dependent: :destroy
  has_many :subjects, through: :subject_teachers
  accepts_nested_attributes_for :subject_teachers, allow_destroy: true

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
