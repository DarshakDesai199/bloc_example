import 'package:bloc_example/grocessory_app/Cart/cart_ui.dart';
import 'package:bloc_example/grocessory_app/Home/Bloc/home_bloc.dart';
import 'package:bloc_example/grocessory_app/Wishlist/wishlist_ui.dart';
import 'package:bloc_example/grocessory_app/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistActionState) {
          debugPrint("Navigate to wishlist screen");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishListPage(homeBloc: homeBloc),
              ));
        } else if (state is HomeNavigateToCartActionState) {
          debugPrint("Navigate to cart screen");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        } else if (state is ProductAddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to cart"),
            backgroundColor: Colors.black45,
          ));
        } else if (state is ProductAddToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to wishlist"),
            backgroundColor: Colors.black45,
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          case HomeSuccessState:
            final data = state as HomeSuccessState;
            return Scaffold(
              appBar: AppBar(title: const Text("Ecommerce App"), actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonEvent());
                    },
                    icon: Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonEvent());
                    },
                    icon: Icon(Icons.card_travel_rounded)),
              ]),
              body: ListView.builder(
                itemCount: data.data.length,
                itemBuilder: (context, index) {
                  // log("***** ${data.data[0]}");

                  return ProductTile(
                    product: data.data[index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Text("Something went to wrong"),
            );
          default:
            return Container();
        }
      },
    );
  }
}
