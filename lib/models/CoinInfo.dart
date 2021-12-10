class CoinInfo {
  String id;
  String symbol;
  String name;
  int? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<String>? categories;
  Map<String, String>? localization;
  Map<String, dynamic> description;
  Links? links;
  Image image;
  String? countryOrigin;
  DateTime? genesisDate;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? developerScore;
  double? communityScore;
  double? liquidityScore;
  int? publicInterestScore;
  MarketData? marketData;
  CommunityData? communityData;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;

  CoinInfo({
    required this.id,
    required this.symbol,
    required this.name,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.localization,
    required this.description,
    this.links,
    required this.image,
    this.countryOrigin,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.developerScore,
    this.communityScore,
    this.liquidityScore,
    this.publicInterestScore,
    this.marketData,
    this.communityData,
    this.statusUpdates,
    this.lastUpdated,
  });

  static CoinInfo fromJson(json) {
    return CoinInfo(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      blockTimeInMinutes: json['blockTimeInMinutes'],
      hashingAlgorithm: json['hashingAlgorithm'],
      categories: json['categories'],
      localization: json['localization'],
      description: json['description'],
      links: json['links'],
      image: json['image'],
      countryOrigin: json['countryOrigin'],
      genesisDate: json['genesisDate'],
      sentimentVotesUpPercentage: json['sentimentVotesUpPercentage'],
      sentimentVotesDownPercentage: json['sentimentVotesDownPercentage'],
      marketCapRank: json['marketCapRank'],
      coingeckoRank: json['coingeckoRank'],
      coingeckoScore: json['coingeckoScore'],
      developerScore: json['developerScore'],
      communityScore: json['communityScore'],
      liquidityScore: json['liquidityScore'],
      publicInterestScore: json['publicInterestScore'],
      marketData: json['marketData'],
      communityData: json['communityData'],
      statusUpdates: json['statusUpdates'],
      lastUpdated: json['lastUpdated'],
    );
  }
}

class Links {
  Links({
    this.homepage,
    this.blockchainSite,
    this.officialForumUrl,
    this.chatUrl,
    this.announcementUrl,
    this.twitterScreenName,
    this.facebookUsername,
    this.bitcointalkThreadIdentifier,
    this.telegramChannelIdentifier,
    this.subredditUrl,
  });

  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  String? twitterScreenName;
  String? facebookUsername;
  dynamic bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
}

class Image {
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  String thumb;
  String small;
  String large;
}

class MarketData {
  MarketData({
    required this.currentPrice,
    this.totalValueLocked,
    this.mcapToTvlRatio,
    this.fdvToTvlRatio,
    this.roi,
    required this.ath,
    this.athChangePercentage,
    required this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.priceChangePercentage7D,
    this.priceChangePercentage14D,
    this.priceChangePercentage30D,
    this.priceChangePercentage60D,
    this.priceChangePercentage200D,
    this.priceChangePercentage1Y,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.priceChange24HInCurrency,
    this.priceChangePercentage1HInCurrency,
    this.priceChangePercentage24HInCurrency,
    this.priceChangePercentage7DInCurrency,
    this.priceChangePercentage14DInCurrency,
    this.priceChangePercentage30DInCurrency,
    this.priceChangePercentage60DInCurrency,
    this.priceChangePercentage200DInCurrency,
    this.priceChangePercentage1YInCurrency,
    this.marketCapChange24HInCurrency,
    this.marketCapChangePercentage24HInCurrency,
    this.totalSupply,
    this.maxSupply,
    this.circulatingSupply,
    this.lastUpdated,
  });

  Map<String, double> currentPrice;
  dynamic totalValueLocked;
  dynamic mcapToTvlRatio;
  dynamic fdvToTvlRatio;
  dynamic roi;
  Map<String, double> ath;
  Map<String, double>? athChangePercentage;
  Map<String, DateTime> athDate;
  Map<String, double>? atl;
  Map<String, double>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, double>? marketCap;
  int? marketCapRank;
  Map<String, double>? fullyDilutedValuation;
  Map<String, double>? totalVolume;
  Map<String, double>? high24H;
  Map<String, double>? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  double? priceChangePercentage7D;
  double? priceChangePercentage14D;
  double? priceChangePercentage60D;
  double? priceChangePercentage30D;
  double? priceChangePercentage200D;
  double? priceChangePercentage1Y;
  int? marketCapChange24H;
  double? marketCapChangePercentage24H;
  Map<String, double>? priceChange24HInCurrency;
  Map<String, double>? priceChangePercentage1HInCurrency;
  Map<String, double>? priceChangePercentage24HInCurrency;
  Map<String, double>? priceChangePercentage7DInCurrency;
  Map<String, double>? priceChangePercentage14DInCurrency;
  Map<String, double>? priceChangePercentage30DInCurrency;
  Map<String, double>? priceChangePercentage60DInCurrency;
  Map<String, double>? priceChangePercentage200DInCurrency;
  Map<String, double>? priceChangePercentage1YInCurrency;
  Map<String, double>? marketCapChange24HInCurrency;
  Map<String, double>? marketCapChangePercentage24HInCurrency;
  int? totalSupply;
  int? maxSupply;
  int? circulatingSupply;
  DateTime? lastUpdated;
}

class CommunityData {
  CommunityData({
    this.facebookLikes,
    this.twitterFollowers,
    this.redditAveragePosts48H,
    this.redditAverageComments48H,
    this.redditSubscribers,
    this.redditAccountsActive48H,
    this.telegramChannelUserCount,
  });

  dynamic facebookLikes;
  int? twitterFollowers;
  double? redditAveragePosts48H;
  double? redditAverageComments48H;
  int? redditSubscribers;
  int? redditAccountsActive48H;
  dynamic telegramChannelUserCount;
}
