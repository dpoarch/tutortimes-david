class RegistrationController < ApplicationController
  before_action :load_user

  def show
    @time_slots = TimeSlot.ordered.all
  end

  def register
    @user.registrations.create!(time_slot_id: params[:time_slot_id])
    redirect_to action: :show
  end

  def cancel
    @user.registrations.where(time_slot_id: params[:time_slot_id]).destroy_all
    redirect_to action: :show
  end

  private def load_user
    @user = User.find_by!(token: params[:token])
  end
end
