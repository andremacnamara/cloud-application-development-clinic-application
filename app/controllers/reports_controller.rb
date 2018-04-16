class ReportsController < ApplicationController
    
    before_action :find_patient
	before_action :find_report, only: [:show, :edit, :update, :destroy]
	before_action :require_login
	
	def new
		@reports = Report.new 
	end 

	def show 
	end

	def create
		@report = Report.new(report_params)
		@report.user_id = current_user.id
		@report.patient_id = @patient.id

		if @report.save
			redirect_to patient_path(@patient)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @report.update(report_params)
			redirect_to patient_path(@patient)
		else 
			render 'edit'
		end
	end

	def destroy
		@report.destroy
		redirect_to patient_path(@patient)
	end
	
	private

		def report_params
			params.require(:report).permit(:date, :report, :title)
		end

		def find_patient
			@patient = Patient.find(params[:patient_id])
		end

		def find_report
			@report = Report.find(params[:id])
		end
end
