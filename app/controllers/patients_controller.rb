class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patient, only: [:show, :edit, :destroy, :update]

  def new
    @patient = Patient.new
  end

  def create

    @patient = Patient.new(patient_params)

    if @patient.save

      flash[:notice] = 'Paciente Creado Satisfactoriamente'
      redirect_to patient_path (@patient)

    else
      flash.now[:alert] = 'Favor de arreglar los problemas abajo'
      render :new
    end
  end

  def show
    @appointments = Appointment.order(created_at: :desc).where("patient_id = #{@patient.id}")
  end

  def index
    @patients = Patient.order(last_name: :asc).where("user_id = #{current_user.id}")
  end

  def edit
  end

  def update
    if @patient.update patient_params
      redirect_to patient_path(@patient), notice: 'Patient Actualizado'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Paciente Eliminado'
  end

  private

  def patient_params
    params.require(:patient).permit([:first_name, :last_name, :birth_date, :gender, :address, :last_appointment, :user_id])
  end

  def find_patient
    @patient = Patient.find params[:id]
  end
end
