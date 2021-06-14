class AdvicePreference < ApplicationRecord
  belongs_to :industry
  belongs_to :user

  SUBJECTS = {
    Salary: ["Question 1",'Question 2'],
    Teamwork: ["Question 3",'Question 4'],
    Management: ["Question 5",'Question 6'],
    "Work-life Balance": ["Question 7",'Question 8'],
    Freelancing: ["Question 9",'Question 10'],
    "Soft Skills": ["Question 11",'Question 12'],
    Careerpath: ["Question 13",'Question 14'],
    Motivation: ["Question 15",'Question 16'],
    Jobhunting: ["Question 17",'Question 18']
        }

end
