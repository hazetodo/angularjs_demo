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

class Todo < ActiveRecord::Base
  belongs_to :todo_list
  validates :todo_list_id, presence: true
  validates :description,  presence: true, length: { maximum: 255 }
  validates :completed, inclusion: { in: [true, false] }
end
