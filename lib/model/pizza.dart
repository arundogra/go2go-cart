import 'package:equatable/equatable.dart';

import 'beverage.dart';

class Pizza extends Equatable {
  final List<Data> data;
  final String bg;

  const Pizza({required this.data, required this.bg});

  @override
  List<Object?> get props => [data, bg];
}

class Data extends Equatable {
  final String img;
  final String info;
  final String name;
  final double rating;
  final List<Sizes> sizes;

  const Data({
    required this.img,
    required this.info,
    required this.name,
    required this.rating,
    required this.sizes,
  });

  @override
  List<Object?> get props => [img, info, name, rating, sizes];
}
