import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_page_event.dart';
part 'add_page_state.dart';

class AddPageBloc extends Bloc<AddPageEvent, AddPageState> {
  AddPageBloc() : super(AddPageInitial()) {
    on<AddPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
