class Topic < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    agenda_items_count :integer
    projects_count :integer
    timestamps
  end
  attr_accessible :name
  
  has_many :agenda_items, inverse_of: :topic, dependent: :destroy, order: "meeting_id desc, position"
  has_many :projects, inverse_of: :topic, dependent: :destroy

  acts_as_list
  
  children :projects
  children :agenda_items

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
