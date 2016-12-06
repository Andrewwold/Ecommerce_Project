class RequestsController < ApplicationController
before_action :set_requests, only: [:show, :edit, :update, :destroy]

  
  def index
    @requests = Request.all
  end

 
  def show
  end

 
  def new
    @requests = Request.new
  end

  def edit
  end

 
  def create
    @requests = Request.new(requests_params)

    respond_to do |format|
      if @requests.save
        format.html { redirect_to @requests, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @requests }
      else
        format.html { render :new }
        format.json { render json: @requests.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @requests.update(requests_params)
        format.html { redirect_to @requests, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @requests }
      else
        format.html { render :edit }
        format.json { render json: @requests.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @requests.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_requests
      @requests = Request.find(params[:id])
    end

    
    def requests_params
      params.require(:request).permit(:book_title, :publishing_date, :author, :desired_price, :language_of_edition)
    end
end
