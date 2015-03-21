# == Schema Information
#
# Table name: todo_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TodoList < ActiveRecord::Base
  has_many :todos, -> { order "created_at DESC" }, dependent: :destroy
  validates :name, presence: true
end
