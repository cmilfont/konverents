class OccurrencesController < ApplicationController
  

  before_filter :authenticate_user!  

  before_filter :authenticate_owner!, :only => [:update, :edit]

  respond_to :html, :json

  def index
  	@occurrences = Occurrence.all
  end

  def show
  	@occurrence = Occurrence.find(params[:id])
  end

  def new
  	@occurrence = Occurrence.new
  end

  def create
  	@occurrence = Occurrence.create(params[:occurrence])
  	respond_with @occurrence
  end

  def edit
  	@occurrence = Occurrence.find(params[:id])
  end

  def update
  	@occurrence = Occurrence.find(params[:id])
  	@occurrence.update_attributes(params[:occurrence])
  	respond_with @occurrence
  end

  def delete
  	@occurrence = Occurrence.find(params[:id])
  	@occurrence.destroy
  	respond_with @occurrence
  end

  private

  def authenticate_owner!
    unless @occurrece.owned_by?(current_user)
      respond_with({:error=>'unauthorised'}, :status => :forbidden) and return
    end
  end

end
