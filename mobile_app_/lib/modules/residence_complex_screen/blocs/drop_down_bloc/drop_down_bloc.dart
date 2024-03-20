



import 'package:flutter_bloc/flutter_bloc.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';


class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(DropDownInitial()) {

    // развернуть лист, развернутое состояние
    on<ExpandListEvent>((event, emit) {
      emit(ExpandedListState());
    });

    // свернуть лист, свернутое состояние
    on<CollapseListEvent>((event, emit) {
      emit(CollapsedListState());
    });

  }
}
