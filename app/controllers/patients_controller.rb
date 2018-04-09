class PatientsController < ApplicationController
  
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  
  def index
    if params[:query].present?
      @patients = Patient.search(params[:query])
    else
      @patients = Patient.where(:user_id => params[:user_id])
    end
  end
  
  def show
  end
  
  def new
    @patient = current_user.patients.build
  end
  
  def create
    @patient = current_user.patients.build(patient_params)
    
    if @patient.save
      redirect_to patient_path(@patient), notice: "Patient Added"
    else
      @errors = @patient.errors.full_messages
      render :new
    end
  end
  
  def edit
    @patient = current_user.patients.find(params[:id])
  end
  
  def update
    @patient = current_user.patients.find(params[:id])
    
    if @patient.update_attributes(patient_params)
      redirect_to patient_path(@patient), notice: "Patient Update"
    else
      @errors = @patient.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    patient = current_user.patients.find(params[:id])
    patient.destroy
    redirect_to  patients_path, notice: "Delete Patient #{patient.name}"
  end
  
  def report 
    render 'patients/report'
  end
  
  private
    def patient_params
      params.require(:patient).permit(:name, :age, :phone, :ailment, :apointment, :status, :consultationType)
    end
    
    def find_patient
      @patient = Patient.find(params[:id])
    end
end