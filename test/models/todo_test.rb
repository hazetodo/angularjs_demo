# == Schema Information
#
# Table name: todos
#
#  id           :integer          not null, primary key
#  todo_list_id :integer          not null
#  description  :string           not null
#  completed    :boolean          default("f"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
