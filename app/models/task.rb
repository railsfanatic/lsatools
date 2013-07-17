class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    due_at         :datetime
    description    :text
    timestamps
  end
  attr_accessible :agenda_item_id, :agenda_item, :due_at, :description, :task_assignments, :users
  
  belongs_to :agenda_item, inverse_of: :tasks, counter_cache: true
  has_many :task_assignments, dependent: :destroy, inverse_of: :task
  has_many :users, through: :task_assignments, accessible: true, dependent: :destroy
  
  acts_as_list scope: :agenda_item
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? && !agenda_item_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end
  
  def move_higher_permitted?
    editable_by?(acting_user, :position)
  end

  def move_lower_permitted?
    editable_by?(acting_user, :position)
  end
  
end
