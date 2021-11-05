class AreaScore {
  AreaScore({
    required this.placement,
    required this.area,
    required this.score,
    this.marked = false,
  });

  final int placement;
  final String area;
  final double score;
  final bool marked;

  static AreaScore fromJson(
          {required Map<String, dynamic> json,
          required int placement,
          required bool marked}) =>
      AreaScore(
        placement: placement,
        area: json['zip_code'],
        score: json['score'],
        marked: marked,
      );
}
