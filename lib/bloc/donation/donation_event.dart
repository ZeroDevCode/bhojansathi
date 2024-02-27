part of 'donation_bloc.dart';

abstract class FoodDonationEvent extends Equatable {
  const FoodDonationEvent();

  @override
  List<Object> get props => [];
}

class LoadFoodDonationEvent extends FoodDonationEvent {}

class AddFoodDonationEvent extends FoodDonationEvent {
  final FoodDonationModel foodDonationModel;

  const AddFoodDonationEvent({required this.foodDonationModel});
}

class UpdateFoodDonationEvent extends FoodDonationEvent {
  final List<FoodDonationModel> foodDonationModel;

  const UpdateFoodDonationEvent({required this.foodDonationModel});
}

class DeleteFoodDonationEvent extends FoodDonationEvent {
  final String foodDonationId;

  const DeleteFoodDonationEvent({required this.foodDonationId});
}
