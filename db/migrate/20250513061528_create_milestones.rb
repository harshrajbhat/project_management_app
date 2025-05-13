class CreateMilestones < ActiveRecord::Migration[8.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
