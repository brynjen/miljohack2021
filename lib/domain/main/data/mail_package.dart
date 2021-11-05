import 'package:equatable/equatable.dart';

class MailPackage extends Equatable {
  const MailPackage({
    required this.id,
    required this.climateOptimized,
    required this.shopName,
    required this.deliveryDate,
    required this.deliveryTimestamp,
    required this.deliveryTime,
  });

  final int id;
  final String shopName;
  final String deliveryDate;
  final String deliveryTime;
  final String deliveryTimestamp;
  final bool climateOptimized;

  static MailPackage fromJson(Map<String, dynamic> json) => MailPackage(
      id: json['package_id'],
      climateOptimized: json['climate_optimized'] == 1,
      shopName: json['shop_name'],
      deliveryTimestamp: json['delivery_timestamp'],
      deliveryDate: json['delivery_date'],
      deliveryTime: json['delivery_time']);

  MailPackage copyWith(
          {bool? climateOptimized,
          String? shopName,
          String? deliveryDate,
          String? deliveryTimestamp,
          String? deliveryTime}) =>
      MailPackage(
        id: id,
        climateOptimized: climateOptimized ?? this.climateOptimized,
        shopName: shopName ?? this.shopName,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTimestamp: deliveryTimestamp ?? this.deliveryTimestamp,
        deliveryTime: deliveryTime ?? this.deliveryTime,
      );

  @override
  List<Object?> get props => [
        id,
        climateOptimized,
        shopName,
        deliveryDate,
        deliveryTimestamp,
        deliveryTime
      ];
}
