<<<<<<< HEAD
# Seed data for testing


=======
require_relative '../lib/user'
require_relative '../lib/gift'

User.delete_all
Gift.delete_all

User.create(name: "David", dob: 10191983)
User.create(name: "Amit", dob: 105011995)
User.create(name: "Roy", dob: 109251985)
User.create(name: "Chelsea", dob: 10121987)
User.create(name: "Jordan", dob: 108231985)


Gift.create(occasion: "Birthday", giver_id: User.all[0].id, receiver_id: User.all[1].id, item_id: 1)
Gift.create(occasion: "Birthday", giver_id: User.all[2].id, receiver_id: User.all[0].id, item_id: 2)
# Gift.create(occasion: "Birthday", user_id: User.all[1].id, item_id: 3)
# Gift.create(occasion: "Wedding", user_id: User.all[2].id, item_id: 4)
# Gift.create(occasion: "Anniversary", user_id: User.all[3].id, item_id: 5)
# Gift.create(occasion: "Graduation", user_id: User.all[4].id, item_id: 6)
>>>>>>> davids_branch
