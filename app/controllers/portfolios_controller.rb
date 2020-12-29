class PortfoliosController < ApplicationController
  before_action :set_port, only:[:show, :edit, :update, :destroy]
  def index
    @portfolio_items = Portfolio.all
    # @portfolio_items = Portfolio.where(subtitle: "Ruby on Rails")
    # 
    # shouldn't have too much logic in the controller
    #@portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :body))

    respond_to do |format|
      if @portfolio_item.save
        # the redirect changes the path to the list instead of show.
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' } # @portfolio_item will redirect to port's show page.
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

    @portfolio_item = Portfolio.find(params[:id])
    
  end
  
  def update

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item}
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully removed.' }
    end
  end

  private
   def set_port
    @portfolio_item = Portfolio.find(params[:id])
   end
  
end
