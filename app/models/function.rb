# == Schema Information
#
# Table name: functions
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  source_db         :string(255)
#  source_identifier :string(255)
#  parent_id         :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Function < ActiveRecord::Base
  attr_accessible :name, :parent_id, :source_db, :source_identifier
  belongs_to :parent, :class_name => "Function", :foreign_key => "parent_id"
  has_many :children, :class_name => "Function", :foreign_key => "parent_id"
  validates :name, presence: true, uniqueness: { scope: :source_db }

  def full_hierarchy
    parent_id ? [ self ] + parent.full_hierarchy : [ self ]
  end

  def hierarchy
    parent_id ? "#{parent.hierarchy}:#{name}" : name
  end

  def root
    parent_id ? parent.root : self
  end
end
