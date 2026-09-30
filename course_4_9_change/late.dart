late int global;

void main() {
  var pizza = Pizza();
  print(pizza);

  global = 1;
  print(global);
}

class Pizza {
  late int id;
  late String name;
  late double price;

  Pizza() {
    id = 1;
    name = 'Spring';
    price = 10;
  }

  String printPizza() {
    print('Coocking pizza...');
    return 'Pizza ($id): $name, price: $price';
  }
}