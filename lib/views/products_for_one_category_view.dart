import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey/cubits/product_for_one_category_cubit/products_for_one_category_cubit.dart';

import '../widgets/custom_product_card_list.dart';

class ProductsForCategory extends StatefulWidget {
  final String categoryName;
  const ProductsForCategory({super.key, required this.categoryName});

  @override
  State<ProductsForCategory> createState() => _ProductsForCategoryState();
}

class _ProductsForCategoryState extends State<ProductsForCategory> {
  @override
  void initState() {
    BlocProvider.of<ProductsForOneCategoryCubit>(context)
        .getProductsForOneCategory(categoryName: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body:
          BlocBuilder<ProductsForOneCategoryCubit, ProductsForOneCategoryState>(
        builder: (context, state) {
          return state is ProductsForOneCategoryLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is ProductsForOneCategoryError
                  ? const Text(
                      'Something Went Wrong! Try Again',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomListProductCard(
                          allProductsModel:
                              BlocProvider.of<ProductsForOneCategoryCubit>(
                                      context)
                                  .listOfProductsForOneCtegory[index],
                        );
                      },
                      itemCount:
                          BlocProvider.of<ProductsForOneCategoryCubit>(context)
                              .listOfProductsForOneCtegory
                              .length,
                    );
        },
      ),
    );
  }
}
