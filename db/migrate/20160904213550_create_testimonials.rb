class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :sender
      t.string :message

      t.timestamps null: false
    end
  end
end
