class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name     :string
    begin_at  :datetime
    end_at    :datetime
    agenda_items_count :integer
    timestamps
  end
  attr_accessible :name, :start_at, :end_at, :topic_id
  
  belongs_to :topic, inverse_of: :projects, counter_cache: true
  has_many :agenda_items, dependent: :destroy, inverse_of: :project, order: :position
  
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
