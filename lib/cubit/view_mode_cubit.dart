import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_mode_state.dart';

class ViewModeCubit extends Cubit<ViewModeState> {
  ViewModeCubit() : super(ViewModeLoading(false));


  changeViewMode()=> emit(ViewMode(!state.isGrid));
}
