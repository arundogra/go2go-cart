import 'package:equatable/equatable.dart';

class Sandwich extends Equatable {
  final String bg;
  final List<Data> data;

  const Sandwich({required this.bg, required this.data});

  @override
  List<Object?> get props => [bg, data];
}

class Data extends Equatable {
  final String img;
  final String name;
  final String info;
  final double price;
  final double rating;

  const Data({
    required this.img,
    required this.name,
    required this.info,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [img, name, info, price, rating];
}
