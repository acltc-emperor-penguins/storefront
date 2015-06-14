CategorizedProduct.create!([
  {product_id: 1, category_id: 3},
  {product_id: 2, category_id: 3},
  {product_id: 3, category_id: 2},
  {product_id: 4, category_id: 4},
  {product_id: 5, category_id: 5},
  {product_id: 6, category_id: 3},
  {product_id: 5, category_id: 6}
])
Category.create!([
  {name: "Chicken"},
  {name: "Steak"},
  {name: "Pork"},
  {name: "Shrimp"},
  {name: "Gunpowder"},
  {name: "Luxury"}
])
Order.create!([
  {user_id: 1, product_id: 2, subtotal: nil, tax: nil, total: nil, quantity: 1},
  {user_id: 1, product_id: 2, subtotal: nil, tax: nil, total: nil, quantity: 1},
  {user_id: 1, product_id: 3, subtotal: nil, tax: nil, total: nil, quantity: 2},
  {user_id: 1, product_id: 2, subtotal: "10.0", tax: nil, total: nil, quantity: 2},
  {user_id: 1, product_id: 5, subtotal: "1000.0", tax: "90.0", total: nil, quantity: 1},
  {user_id: 1, product_id: 5, subtotal: "1000.0", tax: "90.0", total: "1090.0", quantity: 1},
  {user_id: 1, product_id: 5, subtotal: "1000.0", tax: "90.0", total: "1090.0", quantity: 1},
  {user_id: 1, product_id: 1, subtotal: "50.0", tax: "4.5", total: "54.5", quantity: 5}
])
Product.create!([
  {name: "Cochinita Pibil", price: "10.0", image: "http://www.foodpeoplewant.com/wp-content/uploads/2009/09/Tacos-De-Cochinita-Pibil-1024x686.jpg", description: "Mouthwatering, slow-cooked pork on a corn tortilla, served with queso fresco, pickled onions y cilantro!", rating: "", supplier_id: 1},
  {name: "Al Pastor", price: "5.0", image: "http://upload.wikimedia.org/wikipedia/commons/b/b5/01_Tacos_al_Pastor.jpg", description: "Succulent, smoky, earthy, spiced and grilled pork strips seasoned with adobo seasoning. Served on a corn tortilla with cilantro y cebollas", rating: nil, supplier_id: 2},
  {name: "Tacos de Asador", price: "3.0", image: "http://chicago.seriouseats.com/images/2012/10/20121004-224862-chicago-tacos-2-amigos-carne-asada.jpg", description: "Skirt steak seasoned and grilled until crisp, served in a corn tortilla with cilantro y cebollas. Spicy habanero or medium chile salsa upon request. #awesome", rating: nil, supplier_id: 1},
  {name: "Tacos de pescado", price: "1.0", image: "http://i.ytimg.com/vi/gN8IVq7Phn4/maxresdefault.jpg", description: "Fresh Mahi Mahi battered and flash-fried, served on a corn tortilla and garnished with slaw, crema and a side of avocado, lime and pico de gallo.", rating: "5", supplier_id: 2},
  {name: "Exploding Taco", price: "1000.0", image: "http://stream1.gifsoup.com/view7/4201326/exploding-taco-in-slow-motion-o.gif", description: "BOOM!", rating: nil, supplier_id: 1},
  {name: "Carnitas", price: "0.5", image: "http://www.gimmesomeoven.com/wp-content/uploads/2012/09/crispy-slow-cooker-carnitas-2.jpg", description: "Twice-cooked mouthwatering pork tacos served on a corn tortilla con cebollas y cilantro", rating: nil, supplier_id: 2}
])
Supplier.create!([
  {name: "Taco Hut", email: "info@tacohut.awesome", phone: "1800588TACO"},
  {name: "Waco Chili", email: "rich@wacotaco.net", phone: "773323423423"}
])
