class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description, default: 'empty'  #added ,default: 'empty'
      t.string :priority, default: 'empty'  #added ,default: 'empty'

      t.timestamps
    end
  end
end
