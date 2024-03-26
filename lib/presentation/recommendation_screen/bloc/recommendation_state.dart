// ignore_for_file: must_be_immutable

part of 'recommendation_bloc.dart';

/// Represents the state of Recommendation in the application.
class RecommendationState extends Equatable {
  RecommendationState({this.recommendationModelObj});

  RecommendationModel? recommendationModelObj;

  @override
  List<Object?> get props => [
        recommendationModelObj,
      ];

  RecommendationState copyWith({RecommendationModel? recommendationModelObj}) {
    return RecommendationState(
      recommendationModelObj:
          recommendationModelObj ?? this.recommendationModelObj,
    );
  }
}
