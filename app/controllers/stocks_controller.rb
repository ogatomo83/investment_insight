class StocksController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていることを確認する

  def index
    @stocks = current_user.stocks
  end

  def create
    params[:stocks].values.each do |ticker_symbol|
      next if ticker_symbol.blank? # Skip if ticker_symbol is blank
  
      stock = current_user.stocks.new(ticker_symbol: ticker_symbol)
      
      if stock.save
        puts "Successfully created stock with ticker_symbol: #{ticker_symbol}"
      else
        puts "Failed to create stock with ticker_symbol: #{ticker_symbol}. Errors: #{stock.errors.full_messages.join(', ')}"
      end
    end
  
    redirect_to stocks_path
  end
  
  def edit_stocks
    @stocks = current_user.stocks
  end
  
  def show
    @stock = Stock.find(params[:stock_id])
    @financial_report = @stock.financial_reports.find(params[:id])
  end
  
  def save_edited_stocks
  end

  def edit
    @stock = current_user.stocks.find(params[:id])
  end
  
  def update
    @stock = current_user.stocks.find(params[:id])
    if @stock.update(stock_params)
      redirect_to edit_stocks_stocks_path, notice: 'ティッカーシンボルを更新しました。'
    else
      render :edit
    end
  end
  
  private
  
  def stock_params
    params.require(:stock).permit(:ticker_symbol)
  end


end