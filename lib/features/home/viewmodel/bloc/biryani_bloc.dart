import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_ui/features/home/models/biryani_model.dart';
import 'package:zomato_ui/features/home/repository/home_local_repository.dart';

part 'biryani_event.dart';
part 'biryani_state.dart';

class BiryaniBloc extends Bloc<BiryaniEvent, BiryaniState> {
  final HomeLocalRepository _homeLocalRepository;
  BiryaniBloc(this._homeLocalRepository) : super(BiryaniInitial()) {
    on<BiryaniEvent>((event, emit) {});
    on<BiryaniLoaded>(_onBiryaniLoaded);
  }

  void _onBiryaniLoaded(BiryaniLoaded event, Emitter<BiryaniState> emit) async {
    emit(BiryaniLoading());

    try {
      final biryani = await _homeLocalRepository.loadLocalJson();

      emit(BiryaniSuccess(biryani));
    } catch (e) {
      emit(BiryaniFailure(e.toString()));
    }
  }
}
