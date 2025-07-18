part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}
final class SigninSuccess extends SigninState {}
final class SigninLoading extends SigninState {}
final class SigninFailure extends SigninState {
  final Failure failure;
  SigninFailure(this.failure);
}
