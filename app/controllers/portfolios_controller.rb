class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: { except: [:new, :create, :edit, :update, :destroy, :sort] }, site_admin: :all
  layout 'portfolio'
  
  def index
    @portfolio_items = Portfolio.by_position
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    @portfolio_item.destroy
    
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio item was removed.' }
    end
  end
  
  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    
    render nothing: true
  end
  
  private
  
    def portfolio_params
      params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        :image,
                                        :thumbnail,
                                        technologies_attributes: [:id, :name, :_destroy]
                                        )
    end
    
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end
end
