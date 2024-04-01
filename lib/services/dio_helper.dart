import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:storey/models/get_all_products_model.dart';

class DioHelper {
  Dio dio = Dio();

  Future<List<GetAllProductsModel>> getAllProduct() async {
    try {
      Response response = await dio.get('https://fakestoreapi.com/products');

      List<dynamic> jsonData = response.data;
      List<GetAllProductsModel> listOfProducts = [];
      for (var i = 0; i < jsonData.length; i++) {
        listOfProducts.add(GetAllProductsModel.fromJson(jsonData[i]));
      }

      return listOfProducts;
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<dynamic>> getCategoriesTitle() async {
    try {
      Response response =
          await dio.get('https://fakestoreapi.com/products/categories');

      List<dynamic> listOfCategoriesTitle = response.data;
      log(listOfCategoriesTitle.length.toString());
      return listOfCategoriesTitle;
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<GetAllProductsModel>> getProductsByCategoryTitle(
      {required String categoryName}) async {
    try {
      Response response = await dio
          .get('https://fakestoreapi.com/products/category/$categoryName');

      List<dynamic> jsonData = response.data;
      List<GetAllProductsModel> listOfProductForOneCategory = [];
      for (var i = 0; i < jsonData.length; i++) {
        listOfProductForOneCategory
            .add(GetAllProductsModel.fromJson(jsonData[i]));
      }
      log(listOfProductForOneCategory[0].title);
      return listOfProductForOneCategory;
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addProduct({
    required Object data,
  }) async {
    try {
      Response response =
          await dio.post('https://fakestoreapi.com/products', data: data);
      Map<String, dynamic> jsonData = response.data;
      return jsonData;
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
