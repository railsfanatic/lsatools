class Meeting < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    begin_at    :datetime
    location    :string
    description :text
    agenda_items_count :integer, default: 0, null: false
    timestamps
  end
  attr_accessible :begin_at, :location, :description, :agenda_items
  
  has_many :agenda_items, dependent: :destroy, inverse_of: :meeting, order: :position
  
  children :agenda_items
  
  def name
    begin_at
  end
  
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
