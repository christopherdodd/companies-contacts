class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to(:action => 'index')

    else
      render('new')
    end
  end

  def edit

  end

  def new
    @company = Company.new
  end

  def update
  end

  def destroy
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
