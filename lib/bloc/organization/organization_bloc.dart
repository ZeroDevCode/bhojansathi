import 'dart:async';

import 'package:bhojansathi/models/OrganizationModel.dart';
import 'package:bhojansathi/repositories/organization_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc({required OrganizationRepository organizationRepository})
      : _organizationRepository = organizationRepository,
        super(OrganizationInitial()) {
    on<LoadOrganizationEvent>(_onLoadOrganizationEvent);
    on<AddOrganizationEvent>(_onAddOrganizationEvent);
    on<UpdateOrganizationEvent>(_onUpdateOrganizationEvent);
    on<DeleteOrganizationEvent>(_onDeleteOrganizationEvent);
  }

  final OrganizationRepository _organizationRepository;
  StreamSubscription? _organizationSubscription;

  Future<void> _onLoadOrganizationEvent(
      LoadOrganizationEvent event, Emitter<OrganizationState> emit) async {
    _organizationSubscription?.cancel();
    try {
      _organizationSubscription =
          _organizationRepository.getOrganizationList().listen((list) {
        add(UpdateOrganizationEvent(organizationModel: list));
      });
    } catch (e) {
      emit(OrganizationErrorState(message: e.toString()));
    }
  }

  Future<void> _onAddOrganizationEvent(
      AddOrganizationEvent event, Emitter<OrganizationState> emit) async {
    try {
      emit(OrganizationLoadingState());
      await _organizationRepository.addOrganization(event.organizationModel);
      emit(OrganizationOperationSucessState());
    } catch (e) {
      emit(OrganizationErrorState(message: e.toString()));
    }
  }

  void _onUpdateOrganizationEvent(
      UpdateOrganizationEvent event, Emitter<OrganizationState> emit) async {
    emit(OrganizationLoadedState(organizationList: event.organizationModel));
  }

  void _onDeleteOrganizationEvent(
      DeleteOrganizationEvent event, Emitter<OrganizationState> emit) async {
    try {
      emit(OrganizationLoadingState());
      await _organizationRepository
          .deleteOrganization(event.organizationId);
      emit(OrganizationOperationSucessState());
    } catch (e) {
      emit(OrganizationErrorState(message: e.toString()));
    }
  }

}
