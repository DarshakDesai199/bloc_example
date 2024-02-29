import 'package:bloc_example/grocessory_app/Home/Bloc/home_bloc.dart';
import 'package:bloc_example/grocessory_app/widget/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListPage extends StatefulWidget {
  final HomeBloc homeBloc;

  const WishListPage({super.key, required this.homeBloc});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("productWishlist **** ${widget.homeBloc.productWishlist.length}");

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text("Wishlist")),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: widget.homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is ProductRemoveFromWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product removed from wishlist")));
          } else if (state is ProductRemoveFromCartActionState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product removed from cart")));
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: widget.homeBloc.productWishlist.length,
            itemBuilder: (context, index) {
              return WishlistTile(
                homeBloc: widget.homeBloc,
                product: widget.homeBloc.productWishlist[index],
              );
            },
          );
        },
      ),
    );
  }
}
