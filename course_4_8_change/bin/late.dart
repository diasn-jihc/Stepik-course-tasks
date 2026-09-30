late int global;
void main() {
  var pizza = Pizza();
  print(pizza);
  global = 3;
  print(global);
}
class Pizza {
  late int id;
  late String name;
  late double price;
  Pizza() {
    id = 3;
    name = 'Pepperoni';
    price = 15;
  }
  String printPizza() {
    print('Coocking pizza...');
    return 'Pizza ($id): $name, price: $price';
  }
}