import 'package:equatable/equatable.dart';

class Wraps extends Equatable {
  final String bg;
  final List<Data> data;

  const Wraps({required this.bg, required this.data});

  @override
  List<Object?> get props => [bg, data];
}

class Data extends Equatable {
  final String img;
  final String name;
  final String info;
  final double price;
  final double rating;

  Data({
    required this.img,
    required this.name,
    required this.info,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [img, name, info, price, rating];
}
