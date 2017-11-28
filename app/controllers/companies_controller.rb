class CompaniesController < ApplicationController

  def index
    render json: {data: Company.all}
  end

  def alphabetically
    @companies = Company.all.order(name:"ASC")
    render json: {data: @companies}
  end

  def with_modern_plan
    @companies = Company.all.where(plan_level_id: [3,4,5,6]).order(name: "ASC")
    render json: {data: @companies}
  end

end
