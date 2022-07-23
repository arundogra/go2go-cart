import 'package:equatable/equatable.dart';

class Burger extends Equatable {
  final String bg;
  final List<Data> data;

  Burger({
    required this.bg,
    required this.data,
  });

  @override
  List<Object?> get props => [bg, data];
}

class Data extends Equatable {
  final String img;
  final String info;
  final String name;
  final double rating;
  final List<Sizes> sizes;

  Data({
    required this.img,
    required this.info,
    required this.name,
    required this.rating,
    required this.sizes,
  });

  @override
  List<Object?> get props => [img, info, name, rating, sizes];
}

class Sizes extends Equatable {
  final String meal;
  final double price;

  Sizes({required this.meal, required this.price});

  @override
  List<Object?> get props => [meal, price];
}
