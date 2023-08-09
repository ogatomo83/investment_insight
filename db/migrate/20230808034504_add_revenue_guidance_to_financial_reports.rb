class AddRevenueGuidanceToFinancialReports < ActiveRecord::Migration[7.0]
  def change
    add_column :financial_reports, :revenue_guidance_estimate, :decimal
    add_column :financial_reports, :revenue_guidance_actual, :decimal
  end
end
