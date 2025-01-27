import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_bloC.dart';
import 'package:ociuz_shopping/bloc/categories_bloc/categories_event.dart';
import 'package:ociuz_shopping/bloc/category_selection/categoriesselect_bloc.dart';
import 'package:ociuz_shopping/bloc/product_bloc/product_bloc.dart';
import 'package:ociuz_shopping/bloc/product_details_bloc/product_details_bloc.dart';
import 'package:ociuz_shopping/models/cart_model.dart';
import 'package:ociuz_shopping/views/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('Card_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesBloc()..add(CategoriesGetEvent()),
        ),
        BlocProvider(
          create: (context) => CategoriesselectBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
