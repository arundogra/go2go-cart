import 'package:equatable/equatable.dart';
import 'package:go2go_cart/model/pasta.dart';
import 'package:go2go_cart/model/pizza.dart';
import 'package:go2go_cart/model/sandwich.dart';
import 'package:go2go_cart/model/shakes.dart';
import 'package:go2go_cart/model/wraps.dart';

import 'beverage.dart';
import 'burger.dart';
import 'dessert.dart';
import 'fries.dart';
import 'hot_coffee.dart';

class Menu extends Equatable {
  final Pizza mPizza;
  final Burger mBurger;
  final Sandwich mSandwich;
  final Pasta mPasta;
  final Wraps mWraps;
  final Fries mFrenchFries;
  final Beverage mBeverage;
  final Shakes mShakes;
  final Coffee mHotCoffee;
  final Dessert mDessert;

  const Menu(
      {required this.mPizza,
      required this.mBurger,
      required this.mSandwich,
      required this.mPasta,
      required this.mWraps,
      required this.mFrenchFries,
      required this.mBeverage,
      required this.mShakes,
      required this.mHotCoffee,
      required this.mDessert});


  @override
  List<Object?> get props => [
        mPizza,
        mBurger,
        mSandwich,
        mPasta,
        mWraps,
        mFrenchFries,
        mBeverage,
        mShakes,
        mHotCoffee,
        mDessert
      ];
}
