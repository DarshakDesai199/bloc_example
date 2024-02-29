import 'package:bloc_example/grocessory_app/Home/Bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Map product;
  final HomeBloc homeBloc;

  const ProductTile({super.key, required this.product, required this.homeBloc});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      // height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 2, spreadRadius: 1)]),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            '${widget.product['storeImageThumbnail'][0]}',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '${widget.product['name']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      widget.homeBloc.add(ProductAddToWishlistButtonEvent(productData: widget.product));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      widget.homeBloc.add(ProductAddToCartButtonEvent(productData: widget.product));
                    },
                    icon: const Icon(
                      Icons.card_travel_rounded,
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
