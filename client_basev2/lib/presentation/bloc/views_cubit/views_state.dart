part of 'views_cubit.dart';

enum EnumViews {
  match,
  transaction,
}

class ViewsState {
  final EnumViews pageView;
  final bool isEditing;
  final bool isLoading;
  final bool isCanSave;
  final bool isMatch;


  


  ViewsState(
      {this.pageView = EnumViews.match,
      this.isEditing = false,
      this.isLoading = false,this.isCanSave = false, this.isMatch = false});

  ViewsState copyWith({final EnumViews? pageView, final bool? isEditing,
          final bool? isLoading,  bool? isCanSave, final bool? isMatch}) =>
      ViewsState(
          isEditing: isEditing ?? this.isEditing,
          isLoading: isLoading ?? this.isLoading,
          pageView: pageView ?? this.pageView,
          isCanSave: isCanSave ?? this.isCanSave,
          isMatch: isMatch ?? this.isMatch
          );
}
