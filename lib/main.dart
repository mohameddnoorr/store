import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey/constants.dart';
import 'package:storey/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:storey/cubits/categories_title_cubit/categories_title_cubit.dart';
import 'package:storey/cubits/product_for_one_category_cubit/products_for_one_category_cubit.dart';

import 'cubits/all_product_cubit/all_products_cubit.dart';
import 'layout/layout_view.dart';

void main() {
  runApp(const Storey());
}

class Storey extends StatelessWidget {
  const Storey({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllProductsCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesTitleCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsForOneCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primarySwach,
        ),
        home: const LayoutView(),
      ),
    );
  }
}
