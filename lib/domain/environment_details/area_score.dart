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

  static AreaScore fromJson(Map<String, dynamic> json) => AreaScore(
        placement: json[''],
        area: json[''],
        score: json[''],
      );
}
