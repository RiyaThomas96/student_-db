class Credential < ApplicationRecord
    has_many :educations, :dependent => :destroy
    has_many :students, :through => :educations


    def self.search(params)
        students= Student.all
       
        if params[:credential_name].present?
          puts params[:credential_name][:name].inspect
          #  students = Student.joins(:credentials).where (credentials: {name: ["postgraduation"]} )
        end
        students
    end
end