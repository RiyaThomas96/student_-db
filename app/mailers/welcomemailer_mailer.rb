class WelcomemailerMailer < ApplicationMailer
    def notify(student)
        @student = student
        mail(to: @student.email, subject: 'approved')

    end
    def reject(student)
        @student = student
        mail(to: @student.email, subject: 'rejected')
    end
end
