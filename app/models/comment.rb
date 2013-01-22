class Comment < ActiveRecord::Base
  belongs_to :message
  attr_accessible :comment

  validates_presence_of :comment
  validate :message_id_exist

  def message_id_exist
    unless message_id
      errors.add(:message_id, "foreign key can't be blank")
      return false
    end

    begin
      Message.find(self.message_id)
    rescue ActiveRecord::RecordNotFound
      errors.add(:message_id, "foreign key must exist")
      return false
    end
  end
end
