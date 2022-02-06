class Api::V1::RequestsController < ApplicationController
  def index
    render json: RequestSerializer.new(Request.all)
  end

  def show
    if Request.exists?(params[:id])
      render json: RequestSerializer.new(Request.find(params[:id]))
    else
      render json: { errors: { details: "Request not found" } }, status: 404
    end
  end

  def create
    request = Request.create(request_params)
    if request.save
      render json: RequestSerializer.new(Request.find(request.id)), status: 201
    else
      render json: { errors: { details: "There was an error creating this request" } }, status: 400
    end
  end

  def update
    request = Request.update(params[:id], request_params)
    if request.save
      render json: RequestSerializer.new(request)
    else
      render json: { errors: { details: "There was an error updating this request" } }, status: 400
    end
  end

  def destroy
    render json: Request.delete(params[:id])
  end

  private

  def request_params
    params.permit(:name, :details, :item_category, :status, :borrow_date, :return_date, :requested_by_id, :community_id, :lender_id)
  end
end
