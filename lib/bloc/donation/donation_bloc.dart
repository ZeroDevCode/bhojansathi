import 'dart:async';

import 'package:bhojansathi/models/DonationModel.dart';
import 'package:bhojansathi/repositories/dontation/donation_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'donation_event.dart';

part 'donation_state.dart';

class FoodDonationBloc extends Bloc<FoodDonationEvent, FoodDonationState> {
  FoodDonationBloc({required DonationRepository donationRepository})
      : _dontationRepository = donationRepository,
        super(DonationInitialState()) {
    on<LoadFoodDonationEvent>(_onLoadFoodDonationEvent);
    on<AddFoodDonationEvent>(_onAddFoodDonationEvent);
    on<UpdateFoodDonationEvent>(_onUpdateFoodDonationEvent);
    on<DeleteFoodDonationEvent>(_onDeleteFoodDonationEvent);
  }

  final DonationRepository _dontationRepository;
  StreamSubscription? _donationSubscription;

  Future<void> _onLoadFoodDonationEvent(
      FoodDonationEvent event, Emitter<FoodDonationState> emit) async {
    _donationSubscription?.cancel();
    try {
      _donationSubscription =
          _dontationRepository.getFoodDonationList().listen((list) {
        add(UpdateFoodDonationEvent(foodDonationModel: list));
      });
    } catch (e) {
      emit(DonationErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddFoodDonationEvent(
      AddFoodDonationEvent event, Emitter<FoodDonationState> emit) async {
    try {
      emit(DonationLoadingState());
      emit(DonationOperationSucessState());
    } catch (e) {
      emit(DonationErrorState(message: e.toString()));
    }
  }

  void _onUpdateFoodDonationEvent(
      UpdateFoodDonationEvent event, Emitter<FoodDonationState> emit) async {
    emit(DonationLoadedState(foodDonationList: event.foodDonationModel));
  }

  void _onDeleteFoodDonationEvent(
      DeleteFoodDonationEvent event, Emitter<FoodDonationState> emit) async {
    try {
      emit(DonationLoadingState());
      await _dontationRepository
          .deleteFoodDonation(event.foodDonationId);
      emit(DonationOperationSucessState());
    } catch (e) {
      emit(DonationErrorState(message: e.toString()));
    }
  }

  @override
  void onTransition(
      Transition<FoodDonationEvent, FoodDonationState> transition) {
    dev.log(transition.toString(), name: 'FoodDonationBloc`');
    super.onTransition(transition);
  }
}
