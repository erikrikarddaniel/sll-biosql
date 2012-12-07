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

require 'spec_helper'

describe Function do
  before do
    @root = Function.create(
      name: 'Root function',
      source_db: 'test source'
    )
    @child0 = Function.create(
      name: 'Child0 function',
      source_db: 'test source',
      parent_id: @root.id
    )
  end

  subject { @child0 }

  it { should respond_to(:name) }
  it { should respond_to(:source_db) }
  it { should respond_to(:source_identifier) }
  it { should respond_to(:parent) }

  describe "name is required" do
    before do
      @noname = Function.new(
	source_db: 'test source'
      )
    end

    subject { @noname }
    it { should_not be_valid }
  end

  describe "name is unique for its source_db" do
    before do
      @dupname = Function.new(
	name: @child0.name,
	source_db: @child0.source_db
      )
    end

    subject { @dupname }
    it { should_not be_valid }
  end

  describe "file import" do
    before do
      FileParsers.import_functional_hierarchy(fixture_file_upload("/functions.json"))
      @all = Function.find_all_by_source_db('SEED')
    end

    subject { @all }

    its(:length) { should == 7 }
  end
end
