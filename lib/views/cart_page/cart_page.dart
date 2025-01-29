import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/Cart_get/bloc/cartget_bloc.dart';
import 'package:ociuz_shopping/bloc/Cart_get/bloc/cartget_event.dart';
import 'package:ociuz_shopping/bloc/Cart_get/bloc/cartget_state.dart';
import 'package:ociuz_shopping/bloc/cart_delect/bloc/cartdelet_bloc.dart';
import 'package:ociuz_shopping/bloc/cart_delect/bloc/cartdelet_event.dart';
import 'package:ociuz_shopping/bloc/cart_delect/bloc/cartdelet_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    BlocProvider.of<CartgetBloc>(context).add(CartgetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            BlocBuilder<CartgetBloc, CartgetState>(
              builder: (context, state) {
                if (state is CartgetLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CartgetLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.cartData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  state.cartData[index].image.toString(),
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          state.cartData[index].name.toString(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 5),
                                      Text("\$ ${state.cartData[index].price}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green)),
                                    ],
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(Icons.remove),
                                //       onPressed: () {},
                                //     ),
                                //     Text("${1}",
                                //         style: TextStyle(fontSize: 18)),
                                //     IconButton(
                                //       icon: Icon(Icons.add),
                                //       onPressed: () {},
                                //     ),
                                //   ],
                                // ),
                                BlocConsumer<CartdeletBloc, CartdeletState>(
                                  listener: (context, deletstate) {
                                    if (deletstate is CartdeletLoaded) {
                                      BlocProvider.of<CartgetBloc>(context)
                                          .add(CartgetEvent());
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                'Produt Delect',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                    if (deletstate is CartdeletError) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: Colors.red,
                                              content: Text(
                                                deletstate.err.toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                  },
                                  builder: (context, deletstate) {
                                    if (deletstate is CartdeletLoading) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    return IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        BlocProvider.of<CartdeletBloc>(context)
                                            .add(CartdeletEvent(index: index));
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is CartgetError) {
                  return Center(
                      child: Text(
                    state.err.toString(),
                  ));
                }
                return Text('no data');
              },
            )
          ],
        ),
      ),
    );
  }
}
