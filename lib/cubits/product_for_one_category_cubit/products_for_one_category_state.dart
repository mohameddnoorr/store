part of 'products_for_one_category_cubit.dart';

@immutable
sealed class ProductsForOneCategoryState {}

final class ProductsForOneCategoryInitial extends ProductsForOneCategoryState {}

final class ProductsForOneCategoryLoading extends ProductsForOneCategoryState {}

final class ProductsForOneCategorySuccess extends ProductsForOneCategoryState {}

final class ProductsForOneCategoryError extends ProductsForOneCategoryState {}
