class MinistriesController < ApplicationController
  before_action :set_ministry, only: [:show, :edit, :update]

  def new
    @ministry = Ministry.new
  end

  def create
    @ministry = Ministry.new(ministry_params)
    if @ministry.save
      flash[:success] = 'Ministry created'
      redirect_to ministry_path(@ministry)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ministry.update(ministry_params)
      flash[:success] = 'Ministry Updated'
      redirect_to ministry_path(@ministry)
    else
      render :edit
    end
  end

  def show
  end

  protected

  def ministry_params
    params.require(:ministry).permit(:name)
  end

  def set_ministry
    @ministry = Ministry.find(params[:id])
  end
end
