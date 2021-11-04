class MailPackage {
  MailPackage({
    required this.shopName,
    required this.message,
    required this.deliveryDate,
    required this.deliveryTime,
  });

  final String shopName;
  final String message;
  final String deliveryDate;
  final String deliveryTime;

  static MailPackage fromJson(Map<String, dynamic> json) => MailPackage(
      shopName: json['shop_name'],
      message: json['message'],
      deliveryDate: json['delivery_date'],
      deliveryTime: json['delivery_time']);
}
