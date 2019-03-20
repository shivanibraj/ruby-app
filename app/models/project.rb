class Project < ActiveRecord::Base
  
  has_and_belongs_to_many :employees
  #has_many :auto_suggests as: :auto_suggestable 

  validates :name, presence: true
end
