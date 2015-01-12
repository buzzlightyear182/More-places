class DestinationsController < ApplicationController

  def index
    destination_list = Destination.all
    @destinations = []
    destination_list.each do |d|
      unless d.trips.empty?
        @destinations << d
      end
    end
    @destinations
  end

end
