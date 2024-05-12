




import 'package:flutter_bloc/flutter_bloc.dart';

part 'residence_complex_screen_event.dart';
part 'residence_complex_screen_state.dart';



class ResidnceComplexScreenBloc extends Bloc<ResidnceComplexScreenEvent, ResidnceComplexScreenState> {
  ResidnceComplexScreenBloc() : super(ResidnceComplexScreenInitial());
}
