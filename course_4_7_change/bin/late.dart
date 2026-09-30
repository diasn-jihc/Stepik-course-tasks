late int global;
void main() {
  var pizza = Pizza();
  print(pizza);
  global = 2;
  print(global);
}
class Pizza {
  late int id;
  late String name;
  late double price;
  Pizza() {
    id = 2;
    name = 'Margherita';
    price = 12;
  }
  String printPizza() {
    print('Coocking pizza...');
    return 'Pizza ($id): $name, price: $price';
  }
}