json.users do
  json.array! @users, :id, :name, :email
  # json.array! @coupons ,:id, :code, :status, :discount_value, :due_date

end