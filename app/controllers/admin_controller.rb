class AdminController < ApplicationController
    def admin
        @students = Student.all
    end
    def approve
        @students=Student.all
    end
end
