class Employee < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :projects
  # has_many :auto_suggests as: :auto_suggestable 
  validates_processing_of :image
  validate :image_size_validation
  validates :emp_name, :employee_id, :designation, presence: true
  validates_length_of :designation, :maximum => 20 
  validates_uniqueness_of :employee_id
  private

    def image_size_validation
      unless self.image.blank?
        errors.add(:image, "should be less than 2MB") if image.size > 2.megabytes
      end
    end
end 
