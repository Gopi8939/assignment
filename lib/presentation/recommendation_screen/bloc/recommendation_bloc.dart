import 'package:assignment/presentation/recommendation_screen/models/recommendation_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/recommendation_item_model.dart';
part 'recommendation_event.dart';
part 'recommendation_state.dart';

/// A bloc that manages the state of a Recommendation according to the event that is dispatched to it.
class RecommendationBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  RecommendationBloc(RecommendationState initialState) : super(initialState) {
    on<RecommendationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RecommendationInitialEvent event,
    Emitter<RecommendationState> emit,
  ) async {
    emit(state.copyWith(
        recommendationModelObj: state.recommendationModelObj
            ?.copyWith(recommendationItemList: fillRecommendationItemList())));
  }

  List<RecommendationItemModel> fillRecommendationItemList() {
    return List.generate(6, (index) => RecommendationItemModel());
  }
}
