class ExpEntry
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :title, type: String
  field :group, type: Integer
  field :billNo, type: String
  field :amount, type: Float
  field :BillDate, type: Date
  field :user_id, type: Integer
  belongs_to :user
end
