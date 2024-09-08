part of 'getallproduct_cubit.dart';

@immutable
class GetallproductState {}

class GetallproductInitial extends GetallproductState {}

class Getallproduclaoded extends GetallproductState {
  final List <ProductCard> productCard;

  Getallproduclaoded(this.productCard);
}

class GetallproductIloading extends GetallproductState {}

class Getallproductfilure extends GetallproductState {}
