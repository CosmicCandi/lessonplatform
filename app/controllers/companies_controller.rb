class CompaniesController < ApplicationController
  # Get the companies list, except when we're modifying a single record
  before_action :set_companies_list, except: %i[edit show update destroy]

  def index
    # Get a list of all companies
    render json: { data: @companies }
  end

  def alphabetically
    # Render Company names sorted Alphabetically
    render json: { data: @companies.order(name: 'ASC') }
  end

  def with_modern_plan
    # Render companies with a modern plan
    # AKA Plan Level ID is not 1 or 2
    render json: { data: @companies.where(plan_level_id: [3, 4, 5, 6])
                                   .order(name: 'ASC') }
  end

  def not_trialing
    # Render only companies without active trials
    # AKA trial_status == nil
    render json: { data: @companies.where(trial_status: nil).order(name: 'ASC') }
  end

  def created_last_month
    # Use Date.current.beginning_of_month to get the starting day of the month
    # Then subtract one month from it to get last month's beginning day
    beginning_of_last_month = (Date.current.beginning_of_month - 1.month)

    # Use Date.current.end_of_month to get the ending day of the month
    # Then subtract one month from it to get last month's ending day
    end_of_last_month = (Date.current.end_of_month - 1.month)

    # Finally render the list of companies created between the beginning and
    # end of last month
    render json: { data: @companies.where(created_at:
                           beginning_of_last_month..end_of_last_month)
                          .order(name: 'ASC') }
  end

  private

  def set_companies_list
    # Get this once so we don't have to keep getting it
    @companies = Company.all
  end
end
