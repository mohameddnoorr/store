import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storey/constants.dart';
import 'package:storey/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:storey/views/categories_title_view.dart';

import '../views/fav_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import '../widgets/custom_text_field.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String title = '';
  String price = '';
  String description = '';
  String image = '';
  String category = '';
  List<Widget> views = [
    const ProfileView(),
    const CategoriesTitleView(),
    const FavView(),
    const HomeView(),
  ];

  int selectedIndex = 3;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: views.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
          ],
          onTap: onItemTapped,
        ),
        floatingActionButton: BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            return CircleAvatar(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            const Spacer(),
                            CustomTextField(
                              hintText: 'Product Name',
                              onChange: (data) {
                                title = data;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Description',
                              onChange: (data) {
                                description = data;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Price',
                              onChange: (data) {
                                price = data;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Image',
                              onChange: (data) {
                                image = data;
                              },
                            ),
                            CustomTextField(
                              hintText: 'Category',
                              onChange: (data) {
                                category = data;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AddProductCubit>(context)
                                      .addProduct(
                                          title: title,
                                          price: price,
                                          description: description,
                                          image: image,
                                          category: category);
                                }
                                log('success');
                              },
                              child: const Text('Add'),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
