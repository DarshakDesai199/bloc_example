import 'package:bloc_example/Store/bloc/store_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StoreBloc storeBloc = StoreBloc();

  @override
  void initState() {
    storeBloc.add(StoreDataFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => storeBloc.add(CoinsUpdateEvent()),
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<StoreBloc, StoreState>(
        bloc: storeBloc,
        listenWhen: (previous, current) => current is StoreActionState,
        buildWhen: (previous, current) => current is! StoreActionState,
        listener: (context, state) {
          if (state is StoreActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Added 5 coins!"),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case StoreLoadingState:
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            case StoreSuccessState:
              final successState = state as StoreSuccessState;
              return ListView.builder(
                itemCount: successState.stores.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${(index + 1)}. " + successState.stores[index]['name']),
                  );
                },
              );
            case StoreErrorState:
              return const Center(
                child: Text(
                  "Something went wrong!",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
              );
            default:
              return const Center(
                child: SizedBox(),
              );
          }
        },
      ),
    );
  }
}
