class AdvicePreference < ApplicationRecord
  belongs_to :industry
  belongs_to :user

  SUBJECTS = {
    Salary: ['How much salary can I ask?', 'Am I earning my worth?'],
    Teamwork: ['How do I deal with a tough coworker?', 'How can I get my team to bond better?'],
    Management: ['How do I deal with my manager?', 'How can I properly present my idea to my manager?'],
    'Work-life Balance': ['How do I create a better work-life balance?', 'When am I working too much?'],
    Freelancing: ['Can I get some help with becoming a freelancer?', 'How can I promote myself as a freelancer?'],
    'Soft Skills': ['How do I get better at being social?', 'How do improve my soft-skills?'],
    Careerpath: ['What would be a logical next step?', 'Am I stuck in the company that I am in now?'],
    Motivation: ['How can I keep myself motivated?', 'Will more money make me more motivated?'],
    Jobhunting: ['Where can I best look for a job?', 'What skills do I need for a specific job?']
  }
end
