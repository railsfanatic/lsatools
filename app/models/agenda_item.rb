class AgendaItem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title       :string
    notes       :text
    tasks_count :integer, default: 0, null: false
    timestamps
  end
  attr_accessible :meeting_id, :meeting, :position, :title, :description, :notes, :tasks

  belongs_to :meeting, inverse_of: :agenda_items, counter_cache: true
  belongs_to :topic, inverse_of: :agenda_items, counter_cache: true
  belongs_to :project, inverse_of: :agenda_items, counter_cache: true
  has_many :tasks, dependent: :destroy, inverse_of: :agenda_item, order: :position
  
  acts_as_list scope: :meeting
  
  children :tasks
  
  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? && !meeting_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
