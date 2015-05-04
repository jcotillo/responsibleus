json.array!(@coupons) do |coupon|
  json.extract! coupon, :id, :title, :description, :amount, :business_id
  json.url coupon_url(coupon, format: :json)
end
