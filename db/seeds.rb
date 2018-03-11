Advertisement.create!([
  {user_id: 13, category_id: 1, title: "test", description: "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest", price: 400, main_image_file_name: "greenland-1703396_1920.jpg", main_image_content_type: "image/jpeg", main_image_file_size: 248276, main_image_updated_at: "2018-03-11 15:22:55", is_promoted: true, is_published: true, city: "Wałbrzych", voivodeship: "Dolnośląskie"}
])
Category.create!([
  {name: "Motorization", icon: "la la-automobile"},
  {name: "Real Estate", icon: "la la-home"},
  {name: "Work", icon: "la la-briefcase"},
  {name: "House & Garden", icon: "la la-wrench"},
  {name: "Electronics", icon: "la la-cog"},
  {name: "Fashion", icon: "la la-black-tie"},
  {name: "Animals", icon: "la la-paw"},
  {name: "For children", icon: "la la-child"},
  {name: "Sport & Hobby", icon: "la la-futbol-o"},
  {name: "Music & Education", icon: "la la-music"},
  {name: "Services & Business", icon: "la la-envelope"},
  {name: "Relationships", icon: "la la-venus-mars"}
])
