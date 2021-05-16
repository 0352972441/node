part of 'view_mode_cubit.dart';

@immutable
abstract class ViewModeState {
  bool isGrid;
  ViewModeState(this.isGrid);
}

class ViewModeLoading extends ViewModeState {
  ViewModeLoading(bool isGrid): super(isGrid);
}


class ViewMode extends ViewModeState{
  bool isGrid = false;
  ViewMode(this.isGrid): super(isGrid);
}