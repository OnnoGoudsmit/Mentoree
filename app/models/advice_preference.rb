class AdvicePreference < ApplicationRecord
  belongs_to :industry
  belongs_to :user

  SUBJECTS = ['Salary', 'Teamwork', 'Management', 'Work-life Balance', 'Freelancing', 'Soft Skills', 'Careerpath', 'Motivation', 'Jobhunting']
end
