# == Schema Information
#
# Table name: organism_groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  test       :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class OrganismGroup < ActiveRecord::Base
  attr_accessible :name, :test
  validates :name, presence: true, uniqueness: true
  has_many :organism_group_rows, :dependent => :destroy
end
