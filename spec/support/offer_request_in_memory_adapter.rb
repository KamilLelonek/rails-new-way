class OfferRequestInMemoryAdapter < InMemoryAdapter
  private
  def dummy_record(record)
    OpenStruct.new({
                     id:              'c419db98-7846-4cc8-a6e8-5908644c8403',
                     company_name:    record[:company_name],
                     company_phone:   record[:company_phone],
                     company_address: record[:company_address],
                     customer_name:   record[:customer_name],
                     customer_email:  record[:customer_email],
                     delivery_id:     record[:delivery_id],
                     delivery:        OpenStruct.new({
                                                       id:          record[:delivery_id],
                                                       name:        FFaker::Lorem.word,
                                                       description: FFaker::Lorem.paragraph,
                                                     }),
                     products:        [
                                        OpenStruct.new({
                                                         id:          '3a53302c-eb3d-4003-aa92-171d3e3200e6',
                                                         quantity:    record[:products_attributes].first[:quantity],
                                                         category_id: record[:products_attributes].first[:category_id],
                                                         category:    OpenStruct.new({
                                                                                       id:          record[:products_attributes].first[:category_id],
                                                                                       name:        'Frankly Shot',
                                                                                       oz_capacity: rand(1..20),
                                                                                     })
                                                       })
                                      ]
                   })
  end
end
