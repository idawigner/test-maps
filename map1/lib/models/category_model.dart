import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int index;

  const Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.index,
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl, index];

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      index: snap['index'],
    );
  }

  static List<Category> categories = [
    const Category(
      id: '1',
      name: 'Drinks',
      description: 'This is a test description',
      imageUrl: 'assets/juice.png',
      index: 0,
    ),
    const Category(
      id: '2',
      name: 'Pizza',
      description: 'This is a test description',
      imageUrl: 'assets/pizza.png',
      index: 1,
    ),
    const Category(
      id: '3',
      name: 'Burgers',
      description: 'This is a test description',
      imageUrl: 'assets/burger.png',
      index: 2,
    ),
    const Category(
      id: '4',
      name: 'Desserts',
      description: 'This is a test description',
      imageUrl: 'assets/pancake.png',
      index: 3,
    ),
    const Category(
      id: '5',
      name: 'Salads',
      description: 'This is a test description',
      imageUrl: 'assets/avocado.png',
      index: 4,
    ),
  ];
}
