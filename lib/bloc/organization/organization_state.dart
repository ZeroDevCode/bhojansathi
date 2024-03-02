part of 'organization_bloc.dart';

abstract class OrganizationState extends Equatable {
  const OrganizationState();

  @override
  List<Object> get props => [];
}

class OrganizationInitial extends OrganizationState {}


class OrganizationLoadingState extends OrganizationState {}

class OrganizationLoadedState extends OrganizationState {
  final List<OrganizationModel> organizationList;

  const OrganizationLoadedState({required this.organizationList});

  @override
  List<Object> get props => [organizationList];
}

class OrganizationOperationSucessState extends OrganizationState {}

class OrganizationErrorState extends OrganizationState {
  final String message;

  const OrganizationErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

