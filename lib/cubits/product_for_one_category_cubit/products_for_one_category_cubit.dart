import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storey/models/get_all_products_model.dart';
import 'package:storey/services/dio_helper.dart';

part 'products_for_one_category_state.dart';

class ProductsForOneCategoryCubit extends Cubit<ProductsForOneCategoryState> {
  ProductsForOneCategoryCubit() : super(ProductsForOneCategoryInitial());
  List<GetAllProductsModel> listOfProductsForOneCtegory = [];

  getProductsForOneCategory({required String categoryName}) async {
    emit(ProductsForOneCategoryLoading());
    try {
      listOfProductsForOneCtegory = await DioHelper()
          .getProductsByCategoryTitle(categoryName: categoryName);
      emit(ProductsForOneCategorySuccess());
    } on Exception catch (e) {
      log(e.toString());
      emit(ProductsForOneCategoryError());
    }
  }
}
