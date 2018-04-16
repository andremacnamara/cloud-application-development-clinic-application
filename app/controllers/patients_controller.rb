class PatientsController < ApplicationController
  
  #Find patient only for these methods
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  #Patient needs to be logged in
  before_action :require_login

  def index
    #Ransack Search
    #Find all patients that match param q
    @search = Patient.search(params[:q])
    @patients = @search.result
    #If there is no search, show all patients that belong to that doctor.
    if params[:q].blank?
      @patients = Patient.where(:user_id => params[:user_id])
    end
  end
  
  def show
  end
  
  #Renders form for new patient
  def new
    @patient = current_user.patients.build
  end
  
  #Creates the new user.
  def create
    @patient = current_user.patients.build(patient_params)
    
    if @patient.save
      redirect_to patient_path(@patient), notice: "Patient Added"
    else
      @errors = @patient.errors.full_messages
      render :new
    end
  end
  
  #Renders edit form
  def edit
    @patient = current_user.patients.find(params[:id])
  end
  
  #Processes edit.
  def update
    @patient = current_user.patients.find(params[:id])
    
    if @patient.update_attributes(patient_params)
      redirect_to patient_path(@patient), notice: "Patient Update"
    
    else
      @errors = @patient.errors.full_messages
      render :edit
    end
  end
  
  #Deletes
  def destroy
    patient = current_user.patients.find(params[:id])
    patient.destroy
    redirect_to  patients_path, notice: "Delete Patient #{patient.name}"
  end
  
  #Renders the charts
  def report 
    render 'patients/report'
  end
  
  #Method to get the prcice for custom gem
  def price
     @input1 = params[:search_string]
     @result = Checkprice.runcheck(@input1.to_i)
  end
  
  private
    def patient_params
      params.require(:patient).permit(:name, :age, :phone, :ailment, :apointment, :status, :consultationType)
    end
    
    def find_patient
      @patient = Patient.find(params[:id])
    end
end