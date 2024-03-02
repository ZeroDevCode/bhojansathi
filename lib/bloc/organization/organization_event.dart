part of 'organization_bloc.dart';

abstract class OrganizationEvent extends Equatable {
  const OrganizationEvent();

  @override
  List<Object> get props => [];
}

class LoadOrganizationEvent extends OrganizationEvent {}

class AddOrganizationEvent extends OrganizationEvent {
  final OrganizationModel organizationModel;

  const AddOrganizationEvent({required this.organizationModel});
}

class UpdateOrganizationEvent extends OrganizationEvent {
  final List<OrganizationModel> organizationModel;

  const UpdateOrganizationEvent({required this.organizationModel});
}

class DeleteOrganizationEvent extends OrganizationEvent {
  final String organizationId;

  const DeleteOrganizationEvent({required this.organizationId});
}