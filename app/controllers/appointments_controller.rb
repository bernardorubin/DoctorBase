class AppointmentsController < ApplicationController
before_action :authenticate_user!

before_action :find_appointment, only: [:show, :edit, :destroy, :update]

def new
  @patient= params[:patient_id]
  @appointment = Appointment.new
end

def create

  @appointment = Appointment.new(appointment_params)

  if @appointment.save

    flash[:notice] = 'Cita Creada Satisfactoriamente'
    redirect_to appointment_path (@appointment)

  else
    flash.now[:alert] = 'Favor de arreglar los problemas abajo'
    render :new
  end
end

def show
end

def index
  @appointments = Appointment.order(created_at: :desc).where("user_id = #{current_user.id}")
end

def edit
end

def update
  if @appointment.update appointment_params
    redirect_to appointment_path(@appointment), notice: 'Cita actualizada'
  else
    render :edit
  end
end

def destroy
  @appointment.destroy
  redirect_to appointments_path, notice: 'Cita eliminada'
end

private

def appointment_params
  params.require(:appointment).permit([:date, :field1, :patient_id, :user_id])
end

def find_appointment
  @appointment = Appointment.find params[:id]
end


end
