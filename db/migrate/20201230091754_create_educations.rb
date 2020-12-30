class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :highersecondary
      t.string :diploma
      t.string :graduation
      t.string :pg

      t.timestamps
    end
  end
end
