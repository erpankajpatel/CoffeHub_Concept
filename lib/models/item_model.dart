import 'package:appconcept/constants/assets.dart';

class Item {
  String name;
  String image;
  double size;

  Item({required this.name, required this.image, required this.size});

  static List<Item> items() {
    return <Item>[
      Item(name: 'Espresso', image: AppAssets.espresso, size: 50),
      Item(name: 'Cappuccino', image: AppAssets.cappuccino, size: 45),
      Item(name: 'Macchiato', image: AppAssets.macchiato, size: 50),
      Item(name: 'Mocha', image: AppAssets.mocha, size: 50),
      Item(name: 'Latte', image: AppAssets.latte, size: 50),
    ];
  }
}
