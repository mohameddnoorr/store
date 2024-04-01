import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey/constants.dart';
import 'package:storey/views/products_for_one_category_view.dart';

import '../cubits/categories_title_cubit/categories_title_cubit.dart';

class CategoriesTitleView extends StatefulWidget {
  const CategoriesTitleView({super.key});

  @override
  State<CategoriesTitleView> createState() => _CategoriesTitleViewState();
}

class _CategoriesTitleViewState extends State<CategoriesTitleView> {
  @override
  void initState() {
    BlocProvider.of<CategoriesTitleCubit>(context).getCategoriesTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTitleCubit, CategoriesTitleState>(
      builder: (context, state) {
        return state is CategoriesTitleLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state is CategoriesTitleError
                ? const Text(
                    'Something Went Wrong! Try Again',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductsForCategory(
                                categoryName:
                                    BlocProvider.of<CategoriesTitleCubit>(
                                            context)
                                        .listOfCategoriesTitle[index],
                              );
                            }),
                          );
                        },
                        child: Card(
                          color: Colors.white70,
                          margin: const EdgeInsets.all(16),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Center(
                              child: Text(
                                BlocProvider.of<CategoriesTitleCubit>(context)
                                    .listOfCategoriesTitle[index],
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: BlocProvider.of<CategoriesTitleCubit>(context)
                        .listOfCategoriesTitle
                        .length,
                  );
      },
    );
  }
}
