class FinancialReportsController < ApplicationController
  before_action :set_stock, only: [:new, :create, :show, :edit, :update]
  before_action :set_financial_report, only: [:show, :edit, :update]
  
  helper_method :estimate_vs_actual


  def new
    @financial_report = @stock.financial_reports.build
  end
  
  def create
    @financial_report = @stock.financial_reports.build(financial_report_params)
    if @financial_report.save
      redirect_to stock_financial_report_path(@stock, @financial_report)
    else
      render :new
    end
  end



  def show
  end
  
  
  def edit
  end

  def update
    if @financial_report.update(financial_report_params)
      redirect_to stock_financial_report_path(@stock, @financial_report), notice: 'Financial report was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_stock
    @stock = Stock.find(params[:stock_id])
  end

  def set_financial_report
    @financial_report = @stock.financial_reports.find(params[:id])
  end

  def estimate_vs_actual(estimate, actual)
    estimate == actual ? "Match" : "Mismatch"
  end
  
  def financial_report_params
    params.require(:financial_report).permit(:eps_estimate, :eps_actual, :revenue_estimate, :revenue_actual, :eps_guidance_estimate, :eps_guidance_actual, :revenue_guidance_estimate, :revenue_guidance_actual)
  end
end
