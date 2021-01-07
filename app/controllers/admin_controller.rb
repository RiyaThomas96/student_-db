class AdminController < ApplicationController
    def admin
        @students = Student.all
    end
    def list
        @students=Student.all
    end
    
end
