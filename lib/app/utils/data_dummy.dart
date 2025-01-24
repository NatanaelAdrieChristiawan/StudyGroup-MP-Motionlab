import 'package:study_group_flutter/app/data/models/product_model.dart';

class DataDummy {
  static final List<String> listDummyCategories = [
    'All',
    'Watch',
    'Shirt',
    'Shoes',
    'Wearable',
    'Furniture',
  ];

  static final List<ProductModel> listDummyProducts = [
    ProductModel(
      id: '1',
      image: 'assets/images/img_watch.png',
      name: 'Mi Band 8 Pro',
      price: 54.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      isFavorite: true,
      type: 'Watch',
    ),
    ProductModel(
      id: '2',
      image: 'assets/images/img_shirt.png',
      name: 'Lycra Men\'s shirt',
      price: 12.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Shirt',
      isFavorite: false,
    ),
    ProductModel(
      id: '3',
      image: 'assets/images/img_headphone.png',
      name: 'Siberia 800',
      price: 45.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Wearable',
      isFavorite: false,
    ),
    ProductModel(
      id: '4',
      image: 'assets/images/img_shoes.png',
      name: 'Nike Air Jordan',
      price: 35.00,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      type: 'Shoes',
      isFavorite: false,
    ),
  ];
}
