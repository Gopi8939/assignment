import '../../../core/app_export.dart';

/// This class is used in the [recommendation_item_widget] screen.
class RecommendationItemModel {
  RecommendationItemModel({this.id}) {
    id = id ?? "";
  }

  String? id;
}
