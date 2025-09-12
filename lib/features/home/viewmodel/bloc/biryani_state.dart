part of 'biryani_bloc.dart';

@immutable
sealed class BiryaniState {}

final class BiryaniInitial extends BiryaniState {}

final class BiryaniLoading extends BiryaniState {}

final class BiryaniFailure extends BiryaniState {
  final String message;
  BiryaniFailure(this.message);
}

final class BiryaniSuccess extends BiryaniState {
  final BiryaniModel biryani;
  BiryaniSuccess(this.biryani);
}
