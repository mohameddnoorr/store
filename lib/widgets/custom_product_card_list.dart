import 'package:flutter/material.dart';
import 'package:storey/models/get_all_products_model.dart';

class CustomListProductCard extends StatelessWidget {
  final GetAllProductsModel allProductsModel;
  const CustomListProductCard({
    required this.allProductsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width - 120),
                    child: Text(
                      allProductsModel.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text('${allProductsModel.price}\$'),
                ],
              ),
              Image(
                image: NetworkImage(allProductsModel.image),
                height: 100,
                width: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
