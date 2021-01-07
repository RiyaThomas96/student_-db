class Student < ApplicationRecord
  belongs_to :institution
  # after_create :set_rank
  belongs_to :country
  has_many :educations , :dependent => :destroy
  has_many :credentials, :through => :educations
  def self.search(params)
    students = all
    if params[:student_name].present?
      students = students.where("full_name like :name", name: "%#{params[:student_name]}%")
    end

    if params[:institution_name].present?
      students = students.joins(:institution).where('institutions.name like :institution', institution: "%#{params[:institution_name]}%")
    end
    if params[:country_name].present?
      students=students.joins(:country).where('countries.country_name like :country', country:"%#{params[:country_name]}%")
    end
    students
  end

  def set_rank
    
    Student.pluck(:score).order(score: :desc).uniq
  end
end
