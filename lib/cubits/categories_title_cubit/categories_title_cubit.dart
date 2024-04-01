import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storey/services/dio_helper.dart';

part 'categories_title_state.dart';

class CategoriesTitleCubit extends Cubit<CategoriesTitleState> {
  CategoriesTitleCubit() : super(CategoriesTitleInitial());

  List<dynamic> listOfCategoriesTitle = [];

  getCategoriesTitle() async {
    emit(CategoriesTitleLoading());
    try {
      listOfCategoriesTitle = await DioHelper().getCategoriesTitle();
      emit(CategoriesTitleSuccess());
    } on Exception {
      log('cubit Excep');
      emit(CategoriesTitleError());
    }
  }
}
