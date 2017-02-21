class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end
  
  def new
    @portfolio = Portfolio.new
  end
  
  def create
    @portfolio = Portfolio.new(portfolio_params)
    
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def show
    @portfolio = Portfolio.find(params[:id])
  end
  
  def edit
    @portfolio = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @portfolio = Portfolio.find(params[:id])
    
    @portfolio.destroy
    
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was removed.' }
    end
  end
  
  private
  
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end
