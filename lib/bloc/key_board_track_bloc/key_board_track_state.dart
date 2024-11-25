part of 'key_board_track_bloc.dart';

sealed class KeyBoardTrackState extends Equatable {
  final bool isVisible;
  const KeyBoardTrackState(this.isVisible);
}

final class KeyBoardTrackUpdated extends KeyBoardTrackState {
  const KeyBoardTrackUpdated(super.isVisible);

  @override
  List<Object> get props => [isVisible];
}
