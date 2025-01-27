import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_bloc.dart';
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_event.dart';
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_state.dart';

class ProductDetaills extends StatefulWidget {
  const ProductDetaills({super.key, required this.id});
  final String id;

  @override
  State<ProductDetaills> createState() => _ProductDetaillsState();
}

class _ProductDetaillsState extends State<ProductDetaills> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<ProductDetailsBloc>(context)
            .add(ProductGetDetaildEvent(id: widget.id));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
          if (state is ProductGetDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductGetDetailsLoaded) {
            return Column(
              children: [
                Image.network(
                  state.data.image,
                  height: 250,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.data.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.data.description,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            );
          }
          return Text('no data');
        }),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              'Check Box',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Text(
                'add to cart',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
