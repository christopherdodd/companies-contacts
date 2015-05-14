class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @contacts = Contact.where(company_id: params[:id])
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = "Company '#{@company.name}' created Successfully"
      redirect_to(:controller => 'home', :action => 'index')

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
      flash[:notice] = "Company '#{@company.name}' has been updated"
      redirect_to(:action => 'show', :id => @company.id)

    else
      render('edit')
    end
  end

  def destroy
    @company = Company.find(params[:id]).destroy
    flash[:notice] = "Company '#{@company.name}' has been deleted"
    redirect_to(:controller => 'home', :action => 'index')

  end

  private

  def company_params
    params.require(:company).permit(:name, :image)
  end
end
