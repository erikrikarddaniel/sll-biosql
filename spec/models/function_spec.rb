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
      name: 'child0 function',
      source_db: 'test source',
      parent_id: @root.id
    )
    @child1 = Function.create(
      name: 'child1 function',
      source_db: 'test source',
      parent_id: @root.id
    )
    @child00 = Function.create(
      name: 'child00 function',
      source_db: 'test source',
      parent_id: @child0.id
    )
    @child01 = Function.create(
      name: 'child01 function',
      source_db: 'test source',
      parent_id: @child0.id
    )
    @child10 = Function.create(
      name: 'child10 function',
      source_db: 'test source',
      parent_id: @child1.id
    )
  end

  subject { @child0 }

  it { should respond_to(:hierarchy) }
  it { should respond_to(:name) }
  it { should respond_to(:source_db) }
  it { should respond_to(:source_identifier) }
  it { should respond_to(:parent) }
  it { should respond_to(:root) }

  describe "name is required" do
    before do
      @noname = Function.new(
	source_db: 'test source'
      )
    end

    subject { @noname }
    it { should_not be_valid }
  end

  describe "hierarchy and root function" do
    subject { @child01 }

    its(:root) { should == @root }
    its(:hierarchy) { should == [@root, @child0, @child01].map { |n| n.name }.join(":") }
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

  describe "json file import" do
    before do
      FileParsers.import_functional_hierarchy_json(fixture_file_upload("/functions0.json"))
      FileParsers.import_functional_hierarchy_json(fixture_file_upload("/functions1.json"))
      @all = Function.find_all_by_source_db('SEED')
    end

    subject { @all }

    its(:length) { should == 10 }
  end

  describe "meganseed file import" do
    before do
      FileParsers.import_functional_hierarchy_meganfunchierarchy(fixture_file_upload("/functions0.meganseed"))
      FileParsers.import_functional_hierarchy_meganfunchierarchy(fixture_file_upload("/functions1.meganseed"))
      @all = Function.find_all_by_source_db('SEED')
    end

    subject { @all }

    its(:length) { should == 27 }
  end
end
