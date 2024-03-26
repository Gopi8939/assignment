// ignore_for_file: must_be_immutable

part of 'organization_bloc.dart';

/// Represents the state of Organization in the application.
class OrganizationState extends Equatable {
  OrganizationState({
    this.nameController,
    this.locationController,
    this.priceController,
    this.organizationModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? locationController;

  TextEditingController? priceController;

  OrganizationModel? organizationModelObj;

  @override
  List<Object?> get props => [
        nameController,
        locationController,
        priceController,
        organizationModelObj,
      ];

  OrganizationState copyWith({
    TextEditingController? nameController,
    TextEditingController? locationController,
    TextEditingController? priceController,
    OrganizationModel? organizationModelObj,
  }) {
    return OrganizationState(
      nameController: nameController ?? this.nameController,
      locationController: locationController ?? this.locationController,
      priceController: priceController ?? this.priceController,
      organizationModelObj: organizationModelObj ?? this.organizationModelObj,
    );
  }
}
