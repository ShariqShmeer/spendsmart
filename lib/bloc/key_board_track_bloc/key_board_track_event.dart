part of 'key_board_track_bloc.dart';

sealed class KeyBoardTrackEvent extends Equatable {
  const KeyBoardTrackEvent();
}

class UpdateTrackStatus extends KeyBoardTrackEvent {
  final bool isKeyboardVisible;

  const UpdateTrackStatus(this.isKeyboardVisible);

  @override
  List<Object?> get props => [isKeyboardVisible];
}
