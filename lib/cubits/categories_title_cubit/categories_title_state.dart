part of 'categories_title_cubit.dart';

@immutable
sealed class CategoriesTitleState {}

final class CategoriesTitleInitial extends CategoriesTitleState {}

final class CategoriesTitleLoading extends CategoriesTitleState {}

final class CategoriesTitleSuccess extends CategoriesTitleState {}

final class CategoriesTitleError extends CategoriesTitleState {}
