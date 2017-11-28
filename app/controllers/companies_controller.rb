class CompaniesController < ApplicationController

  def index
    render json: {data: Company.all}
  end

  def alphabetically
    @companies = Company.all.order(name:"ASC")
    render json: {data: @companies}
  end

end
