class ChangeUniversityToEducation < ActiveRecord::Migration[7.0]
  def change
    rename_column :doctors, :university, :education
  end
end
