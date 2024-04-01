import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storey/models/get_all_products_model.dart';
import 'package:storey/services/dio_helper.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  Future<GetAllProductsModel> addProduct({
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await DioHelper().addProduct(
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );

    log(data.toString());
    return GetAllProductsModel.fromJson(data);
  }
}
