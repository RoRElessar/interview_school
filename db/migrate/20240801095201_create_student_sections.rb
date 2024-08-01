class CreateStudentSections < ActiveRecord::Migration[7.1]
  def change
    create_table :student_sections do |t|
      t.references :student, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
