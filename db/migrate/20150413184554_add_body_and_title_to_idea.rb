class AddBodyAndTitleToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :body, :text
    add_column :ideas, :title, :string
  end
end
