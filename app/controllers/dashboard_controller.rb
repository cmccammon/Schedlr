class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to root_path unless current_user && current_user.admin?
  end

  def index
    @rooms = current_user.company.rooms
    @events = current_user.company.events
    @invitees = current_user.company.invitees
  end
end
