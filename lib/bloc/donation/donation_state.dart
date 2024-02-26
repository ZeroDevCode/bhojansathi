part of 'donation_bloc.dart';

abstract class FoodDonationState extends Equatable {
  const FoodDonationState();

  @override
  List<Object> get props => [];
}

class DonationInitialState extends FoodDonationState {}


class DonationLoadingState extends FoodDonationState {}

class DonationLoadedState extends FoodDonationState {
  final List<FoodDonationModel> foodDonationList;

  const DonationLoadedState({required this.foodDonationList});

  @override
  List<Object> get props => [foodDonationList];
}

class DonationOperationSucessState extends FoodDonationState {}

class DonationErrorState extends FoodDonationState {
  final String message;

  const DonationErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
