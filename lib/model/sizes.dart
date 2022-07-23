import 'package:equatable/equatable.dart';

class Sizes extends Equatable {
  final double price;
  final int slices;
  final String size;

  const Sizes({
    required this.price,
    required this.slices,
    required this.size
  });

  @override
  List<Object?> get props => [price, slices, size];
}
