class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @contacts = Contact.where(:company_id => params[:id])
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
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(company_params)
      redirect_to(:action => 'show', :id => @company.id)

    else
      render('edit')
    end
  end

  def destroy
    @company = Company.find(params[:id]).destroy
    redirect_to(:action => 'index')

  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
