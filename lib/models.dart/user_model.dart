class userModel {
  final String? name;
  final String? type;
  final String? profile_pic;
  final String? organization;
  final double? rating;
  final int? user_id;

  userModel(
      {this.name,
      this.type,
      this.rating,
      this.profile_pic,
      this.organization,
      this.user_id});
}

class ListerModel {
  final bool? active;
  final List? history;
  final String? shop_closing;
  final String? material;
  final String? latitude;
  final String? logitude;
  final String? list_time;

  ListerModel(
      {this.active,
      this.history,
      this.shop_closing,
      this.material,
      this.latitude,
      this.logitude,
      this.list_time});
}

class PickupModel {
  final bool? pickup_stat;
  final String? pickup_time;
  final String? organization;

  PickupModel({this.pickup_stat, this.pickup_time, this.organization});
}
