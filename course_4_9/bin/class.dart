void main() {
  var pizza = Pizza(name: 'Spring');
  print(pizza.printPizza());
}

class Pizza {
  late final int id;
  final String name;
  final double? price;

  Pizza({
    required this.name, 
    this.price
  }) : id = 1;

  String printPizza() {
    print('Cooking pizza...');
    return 'Pizza ($id): $name, price: ${price ?? 'No price'}';
  }
}
