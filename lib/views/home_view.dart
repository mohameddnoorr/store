import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/all_product_cubit/all_products_cubit.dart';
import '../widgets/custom_product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<AllProductsCubit>(context).getAllProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 70),
          child: state is AllProductsLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is AllProductsError
                  ? const Center(
                      child: Text(
                        'Something Went Wrong! Try Again',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : GridView.builder(
                      clipBehavior: Clip.none,
                      physics:
                          const ScrollPhysics(parent: BouncingScrollPhysics()),
                      itemCount: BlocProvider.of<AllProductsCubit>(context)
                          .listOfProducts
                          .length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 80),
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          allProductsModel:
                              BlocProvider.of<AllProductsCubit>(context)
                                  .listOfProducts[index],
                        );
                      },
                    ),
        );
      },
    );
  }
}
