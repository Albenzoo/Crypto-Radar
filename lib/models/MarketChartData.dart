class MarketChartData {
  final List<dynamic> prices;
  final List<dynamic> market_caps;
  final List<dynamic> total_volumes;

  MarketChartData({
    required this.prices,
    required this.market_caps,
    required this.total_volumes,
  });

  static MarketChartData fromJson(json) {
    return MarketChartData(
      prices: json['prices'],
      market_caps: json['market_caps'],
      total_volumes: json['total_volumes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prices'] = this.prices;
    data['market_caps'] = this.market_caps;
    data['total_volume'] = this.total_volumes;
    return data;
  }
}
