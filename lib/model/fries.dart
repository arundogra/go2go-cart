import 'package:equatable/equatable.dart';

class Fries extends Equatable {
  final String bg;
  final List<Data> data;

  const Fries({
    required this.bg,
    required this.data,
  });

  @override
  List<Object?> get props => [bg, data];
}

class Data extends Equatable {
  final String img;
  final String name;
  final String info;
  final double rating;
  final List<Sizes> sizes;

  Data({
    required this.img,
    required this.name,
    required this.info,
    required this.rating,
    required this.sizes,
  });

  @override
  List<Object?> get props => [img, name, info, rating, sizes];
}

class Sizes extends Equatable {
  final double price;
  final String size;

  Sizes({
    required this.price,
    required this.size
  });

  @override
  List<Object?> get props => [price, size];
}
