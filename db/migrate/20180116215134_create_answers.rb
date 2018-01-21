class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.question :references
      t.text :body

      t.timestamps
    end
  end
end
