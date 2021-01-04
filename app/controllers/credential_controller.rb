class CredentialController < ApplicationController
    def index
        @students = Student.search(params)
    end
    
end
