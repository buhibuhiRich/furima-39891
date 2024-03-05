def save
  return false unless valid?

  order = Order.create!(
    postal_code: postal_code,
    shipping_from_region_id: shipping_from_region_id,
    city: city,
    street_address: street_address,
    building_name: building_name,
    phone_number: phone_number,
    user: user,
    item: item,
    shipping_address_attributes: {  
      postal_code: postal_code,
      region_id: shipping_from_region_id,
      city: city,
      street_address: street_address,
      building_name: building_name
    }
  )

  true
end
