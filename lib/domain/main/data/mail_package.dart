class MailPackage {
  MailPackage({
    required this.id,
    required this.climateOptimized,
    required this.shopName,
    required this.message,
    required this.deliveryDate,
    required this.deliveryTime,
  });

  final int id;
  final String shopName;
  final String message;
  final String deliveryDate;
  final String deliveryTime;
  final bool climateOptimized;

  static MailPackage fromJson(Map<String, dynamic> json) => MailPackage(
      id: json['package_id'],
      climateOptimized: json['climate_optimized'] == 1,
      shopName: json['shop_name'],
      message: json['message'],
      deliveryDate: json['delivery_date'],
      deliveryTime: json['delivery_time']);

  MailPackage copyWith(
          {bool? climateOptimized,
          String? shopName,
          String? message,
          String? deliveryDate,
          String? deliveryTime}) =>
      MailPackage(
        id: id,
        climateOptimized: climateOptimized ?? this.climateOptimized,
        shopName: shopName ?? this.shopName,
        message: message ?? this.message,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
      );
}
