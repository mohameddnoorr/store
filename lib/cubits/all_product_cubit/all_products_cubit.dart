import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey/models/get_all_products_model.dart';
import 'package:storey/services/dio_helper.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());
  List<GetAllProductsModel> listOfProducts = [];
  getAllProduct(context) async {
    emit(AllProductsLoading());
    try {
      listOfProducts = await DioHelper().getAllProduct();

      emit(AllProductsSuccess());
    } on DioException {
      log('Dio Excep ....  Cubit ');
      emit(AllProductsError());
    } catch (e) {
      log(e.toString());
      emit(AllProductsError());
    }
  }
}
