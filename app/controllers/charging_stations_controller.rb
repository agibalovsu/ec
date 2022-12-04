# frozen_string_literal: true

class ChargingStationsController < ApplicationController
  before_action :find_point

  def index
    render json: @point.charging_stations, include: :connectors
  end

  private

  def find_point
    @point = Point.find(params[:point_id])
  end
end
