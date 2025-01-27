// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  List categData = [];
  CategoriesLoadedState({required this.categData});
}

class CategoriesErrorState extends CategoriesState {
  String? err;
  CategoriesErrorState({
    this.err,
  });
}
