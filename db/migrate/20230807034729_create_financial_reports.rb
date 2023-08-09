class CreateFinancialReports < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_reports do |t|
      t.references :stock, null: false, foreign_key: true
      t.integer :year
      t.integer :quarter
      t.decimal :eps_estimate
      t.decimal :eps_actual
      t.decimal :revenue_estimate
      t.decimal :revenue_actual
      t.decimal :eps_guidance_estimate
      t.decimal :eps_guidance_actual

      t.timestamps
    end
  end
end
