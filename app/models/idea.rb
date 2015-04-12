class Idea < ActiveRecord::Base

	has_many :requirements
	has_many :qualifications
	
	accepts_nested_attributes_for :requirements, reject_if: proc { |attributes| attributes['name'].blank? },
		allow_destroy: true
	accepts_nested_attributes_for :qualifications, reject_if: proc { |attributes| attributes['add'].blank? },
		allow_destroy: true
	

	has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :description, presence: true, length: { maximum: 80 }
	validates :title, :image, presence: true
end
