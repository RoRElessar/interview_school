class CreateSubjectTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :subject_teachers do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :level, null: false

      t.timestamps
    end
    add_index :subject_teachers, [:teacher_id, :subject_id], unique: true
  end
end
