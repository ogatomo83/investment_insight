class StocksController < ApplicationController
  before_action :authenticate_user! # 追加：ユーザーがログインしていることを確認する

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
  
  def save_edited_stocks
    # ここでティッカーシンボルの保存や編集、削除のロジックを実装
  end
  
  def stock_detail
    @stock = Stock.find(params[:id])
  end


end