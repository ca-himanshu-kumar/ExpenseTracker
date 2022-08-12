json.extract! exp_entry, :id, :title, :group, :billNo, :amount, :BillDate, :user_id, :created_at, :updated_at
json.url exp_entry_url(exp_entry, format: :json)
