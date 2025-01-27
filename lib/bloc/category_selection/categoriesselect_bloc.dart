import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ociuz_shopping/bloc/category_selection/catergories_selection_event.dart';

class CategoriesselectBloc extends Bloc<CatergoriesEvent, int> {
  CategoriesselectBloc() : super(0) {
    on<CatergoriesEvent>(
      (event, emit) {
        emit(event.index);
      },
    );
  }
}
