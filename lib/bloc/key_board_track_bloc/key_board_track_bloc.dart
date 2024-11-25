import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'key_board_track_event.dart';
part 'key_board_track_state.dart';

class KeyBoardTrackBloc extends Bloc<KeyBoardTrackEvent, KeyBoardTrackState> {
  KeyBoardTrackBloc() : super(const KeyBoardTrackUpdated(false)) {
    on<UpdateTrackStatus>((event, emit) {
      emit(KeyBoardTrackUpdated(event.isKeyboardVisible));
    });
  }

  // Method to update keyboard visibility
  void updateKeyboardVisibility(BuildContext context) {
    final isKeyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
    if (context.read<KeyBoardTrackBloc>().state.isVisible !=
        isKeyboardVisible) {
      add(UpdateTrackStatus(isKeyboardVisible));
    }
  }
}
