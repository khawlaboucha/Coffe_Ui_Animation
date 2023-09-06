import 'dart:math';
double  _doubleInRange(Random source,num start, num end)=>source.nextDouble()*(end-start)+start;
final random=Random();
final coffees=List.generate(
  _names.length, (index) => Coffee(
  image:'assets/coffee_consepts/${index+1}.png',
  name:_names[index],
  price:_doubleInRange(random,3,7),
),);
class Coffee{
  Coffee({
    required this.name,
    required this.image,
    required this.price,
  });
  late final String name;
  late final String image;
  late final double price;}

final _names=[
  'Caramel Cold Drink',
  'Iced Coffe Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Late',
  'Capuchino',
  'Toffee Nut Iced Latte',
  'Americano',
  'Caramel Macchiato',
  'Vietnamese-Style Iced Coffee',
  'Black Tea Latte',
  'classic Irish Coffe'
  'Toffee Nut Crunch Latte',
  'Black Tea Latte',
  'classic Irish Coffe',
  'Toffee Nut Crunch Latte'
];
