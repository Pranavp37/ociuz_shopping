import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_bloC.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_state.dart';
import 'package:ociuz_shopping/bloc/category_selection/categoriesselect_bloc.dart';
import 'package:ociuz_shopping/bloc/category_selection/catergories_selection_event.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_bloc.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_event.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_state.dart';
import 'package:ociuz_shopping/views/cart_page/cart_page.dart';
import 'package:ociuz_shopping/views/product%20details/product__details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<ProductBloc>(context)
            .add(ProductGetEvent(category: 'electronics'));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
              },
              icon: Icon(Icons.shopping_bag))
        ],
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(13),
        child: Column(
          children: [
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CategoriesLoadedState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        state.categData.length,
                        (index) => BlocBuilder<CategoriesselectBloc, int>(
                            builder: (context, slectedSate) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<CategoriesselectBloc>(context)
                                  .add(CatergoriesEvent(index: index));
                              BlocProvider.of<ProductBloc>(context).add(
                                  ProductGetEvent(
                                      category: state.categData[index]));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: slectedSate == index
                                        ? Colors.black
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  state.categData[index],
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: slectedSate == index
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }
                if (state is CategoriesErrorState) {
                  return Text(state.err.toString());
                }
                return Text(' no data');
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductLoaded) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 240,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetaills(
                                id: state.data[index].id.toString(),
                              ),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              state.data[index].image,
                              height: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              state.data[index].title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Price : ${state.data[index].price.toString()} rs',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: state.data.length,
                  ),
                );
              }
              return Text('no data');
            })
          ],
        ),
      ),
    );
  }
}
