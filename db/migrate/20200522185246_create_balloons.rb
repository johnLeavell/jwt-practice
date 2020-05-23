class CreateBalloons < ActiveRecord::Migration[6.0]
  def change
    create_table :balloons do |t|
      t.string :name

      t.timestamps
    end
  end
end
