class AddProducerReferenceToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :producer, foreign_key: true
  end
end
