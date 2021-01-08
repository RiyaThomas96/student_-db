class AdminController < ApplicationController
    before_action :set_student, only: [:approve,:reject]

    def admin
        @students = Student.all
    end
    def list
        @students=Student.all
    end
    def approve
        respond_to do |format|
         @student.update(student_params)
           # format.html { redirect_to @student, notice: 'Student was successfully updated.' }
            format.html{redirect_back(fallback_location: root_path, notice: 'student was approved')}
            format.json { render :show, status: :ok, location: @student }
        end  
        if @student.approved?
          WelcomemailerMailer.notify(@student).deliver_later(wait: 1.minute)
        end
    end
    def reject
       WelcomemailerMailer.reject(@student).deliver_later(wait: 1.minute)
       respond_to do |format|
        @student.update(student_params)
        # format.html { redirect_to @student, notice: 'Student was successfully updated.' }
            format.html{redirect_back(fallback_location: root_path, notice: 'student was rejected')}
            format.json { render :show, status: :ok, location: @student }
    
        end 
        
    end
    def set_student
        @student = Student.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def student_params
        params.require(:student).permit(:full_name, :address, :mobile, :email, :institution_id, :country_id, :approved, credential_ids: [])
      end
end
