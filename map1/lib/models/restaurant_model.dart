import 'package:equatable/equatable.dart';

import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  // final String description;
  final List<String> tags;
  final List<MenuItem> menuItems;
  // final List<Category> categories;
  // final List<Product> products;
  // final List<OpeningHours> openingHours;
  final int deliveryTime;
  // final String priceCategory;
  final double deliveryFee;
  final double distance;
  // final Place address;

  const Restaurant({
    required this.id,
    required this.name,
    // required this.description,
    required this.imageUrl,
    required this.tags,
    required this.menuItems,
    // required this.categories,
    // required this.products,
    // required this.openingHours,
    // required this.address,
    this.deliveryTime = 10,
    // this.priceCategory = '\$',
    this.deliveryFee = 10,
    this.distance = 15,
  });

  // factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
  //   return Restaurant(
  //     id: snap.id,
  //     name: snap['name'],
  //     imageUrl: snap['imageUrl'],
  //     description: snap['description'],
  //     tags: (snap['tags'] as List).map(
  //       (tag) {
  //         return tag as String;
  //       },
  //     ).toList(),
  //     categories: (snap['categories'] as List).map(
  //       (category) {
  //         return Category.fromSnapshot(category);
  //       },
  //     ).toList(),
  //     products: (snap['products'] as List).map(
  //       (product) {
  //         return Product.fromSnapshot(product);
  //       },
  //     ).toList(),
  //     openingHours: (snap['openingHours'] as List).map(
  //       (openingHour) {
  //         return OpeningHours.fromSnapshot(openingHour);
  //       },
  //     ).toList(),
  //     address: Place.fromJson(snap['address']),
  //   );
  // }

  @override
  List<Object?> get props => [
        id,
        name,
        // description,
        imageUrl,
        tags,
        menuItems,
        // categories,
        // products,
        // openingHours,
        deliveryTime,
        // priceCategory,
        deliveryFee,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Golden Ice',
      imageUrl: 'https://unsplash.com/photos/TLD6iCOlyb0',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      deliveryTime: 20,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      name: 'Golden Ice Gelato',
      imageUrl: 'https://unsplash.com/photos/8beTH4VkhLI',
      tags: const ['Italian', 'Dessert', 'Ice Cream'],
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      deliveryTime: 30,
      deliveryFee: 3.99,
      distance: 0.2,
    ),
  ];
}
