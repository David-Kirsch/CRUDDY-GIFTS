require_relative '../lib/user'
require_relative '../lib/gift'
require_relative '../lib/item'

User.delete_all
Gift.delete_all
Item.delete_all

User.create(name: "David", dob: 10191983)
User.create(name: "Amit", dob: 105011995)
User.create(name: "Roy", dob: 109251985)
User.create(name: "Chelsea", dob: 10121987)
User.create(name: "Jordan", dob: 108231985)

Item.create(name: "Arc Soundbar", brand: "Sonos", price: 799.99, category: "Electronics", description: 
"Transform your music or watching experience with this Sonos Arc Premium smart soundbar. " + 
"The 3D sound coupled with Dolby Atmos deliver an immersive audio output, while the Trueplay " +
"tuning technology adapts to room acoustics for accurate localization. This low-profile Sonos Arc " +
"Premium smart soundbar has 11 high-performance drivers and elliptical woofers for powerful rich " +
"bass, and the voice control support offers hassle-free control.")
Item.create(name: "AirPods Pro", brand: "Apple", price: 249.99, category: "Electronics", description: 
"Active noise cancellation for immersive sound. Transparency mode for hearing and connecting " +
"with the world around you. A more customizable fit for all-day comfort. Sweat- and water-resistant. "+
"All in a super light, in-ear headphone that's easy to set up with all your Apple devices.")
#Item.create(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )
# Item.new(name: , brand: , price: , category: , description: )

Gift.create(occasion: "Birthday", giver_id: User.all[0].id, receiver_id: User.all[1].id, item_id: Item.all[1].id)
Gift.create(occasion: "Birthday", giver_id: User.all[2].id, receiver_id: User.all[0].id, item_id: Item.all[1].id)
# Gift.create(occasion: "Birthday", giver_id: User.all[1].id, receiver_id: User.all[3].id, item_id: 4)
# Gift.create(occasion: "Wedding", giver_id: User.all[2].id, receiver_id: User.all[4].id, item_id: 4)
# Gift.create(occasion: "Anniversary", giver_id: User.all[3].id, receiver_id: User.all[0].id, item_id: 5)
# Gift.create(occasion: "Graduation", giver_id: User.all[4].id, receiver_id: User.all[2].id, item_id: 6)


