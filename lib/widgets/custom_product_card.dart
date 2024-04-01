import 'package:flutter/material.dart';
import 'package:storey/models/get_all_products_model.dart';

class CustomProductCard extends StatelessWidget {
  final GetAllProductsModel allProductsModel;
  const CustomProductCard({
    required this.allProductsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            margin:
                const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
            elevation: 12,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allProductsModel.title,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${allProductsModel.price}\$'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 90,
            child: Image(
              image: NetworkImage(allProductsModel.image),
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
