class CoinInfo {
  String id;
  String symbol;
  String name;
  int? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<dynamic>? categories;
  Lang? localization;
  Map<String, dynamic> description;
  Links? links;
  CoinImage image;
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
  MarketData market_data;
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
    required this.market_data,
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
      localization: Lang.fromJson(json["localization"]),
      description: json['description'],
      links: Links.fromJson(json["links"]),
      image: CoinImage.fromJson(json["image"]),
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
      market_data: MarketData.fromJson(json['market_data']),
      communityData: json['communityData'],
      statusUpdates: json['statusUpdates'],
      lastUpdated: json['lastUpdated'],
    );
  }
}

class Lang {
  Lang({
    this.en,
    this.de,
    this.es,
    this.fr,
    this.it,
    this.pl,
    this.ro,
    this.hu,
    this.nl,
    this.pt,
    this.sv,
    this.vi,
    this.tr,
    this.ru,
    this.ja,
    this.zh,
    this.zhTw,
    this.ko,
    this.ar,
    this.th,
    this.id,
  });

  String? en;
  String? de;
  String? es;
  String? fr;
  String? it;
  String? pl;
  String? ro;
  String? hu;
  String? nl;
  String? pt;
  String? sv;
  String? vi;
  String? tr;
  String? ru;
  String? ja;
  String? zh;
  String? zhTw;
  String? ko;
  String? ar;
  String? th;
  String? id;

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
        en: json["en"],
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        it: json["it"],
        pl: json["pl"],
        ro: json["ro"],
        hu: json["hu"],
        nl: json["nl"],
        pt: json["pt"],
        sv: json["sv"],
        vi: json["vi"],
        tr: json["tr"],
        ru: json["ru"],
        ja: json["ja"],
        zh: json["zh"],
        zhTw: json["zh-tw"],
        ko: json["ko"],
        ar: json["ar"],
        th: json["th"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "de": de,
        "es": es,
        "fr": fr,
        "it": it,
        "pl": pl,
        "ro": ro,
        "hu": hu,
        "nl": nl,
        "pt": pt,
        "sv": sv,
        "vi": vi,
        "tr": tr,
        "ru": ru,
        "ja": ja,
        "zh": zh,
        "zh-tw": zhTw,
        "ko": ko,
        "ar": ar,
        "th": th,
        "id": id,
      };
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

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
        blockchainSite:
            List<String>.from(json["blockchain_site"].map((x) => x)),
        officialForumUrl:
            List<String>.from(json["official_forum_url"].map((x) => x)),
        chatUrl: List<String>.from(json["chat_url"].map((x) => x)),
        announcementUrl:
            List<String>.from(json["announcement_url"].map((x) => x)),
        twitterScreenName: json["twitter_screen_name"],
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
      );
}

class CoinImage {
  CoinImage({
    required this.thumb,
    required this.small,
    required this.large,
  });

  String thumb;
  String small;
  String large;

  factory CoinImage.fromJson(Map<String, dynamic> json) => CoinImage(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );
}

class MarketData {
  MarketData({
    required this.current_price,
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

  Map<String, double> current_price;
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

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        current_price: Map.from(json["current_price"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athChangePercentage: Map.from(json["ath_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athDate: Map.from(json["ath_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlChangePercentage: Map.from(json["atl_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlDate: Map.from(json["atl_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json["market_cap_rank"],
        totalVolume: Map.from(json["total_volume"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        high24H: Map.from(json["high_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        low24H: Map.from(json["low_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"].toDouble(),
        priceChangePercentage14D:
            json["price_change_percentage_14d"].toDouble(),
        priceChangePercentage30D:
            json["price_change_percentage_30d"].toDouble(),
        priceChangePercentage60D:
            json["price_change_percentage_60d"].toDouble(),
        priceChangePercentage200D:
            json["price_change_percentage_200d"].toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency:
            Map.from(json["price_change_percentage_1h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency:
            Map.from(json["price_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency:
            Map.from(json["price_change_percentage_7d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency:
            Map.from(json["price_change_percentage_14d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency:
            Map.from(json["price_change_percentage_30d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency:
            Map.from(json["price_change_percentage_60d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency:
            Map.from(json["price_change_percentage_200d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency:
            Map.from(json["price_change_percentage_1y_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChange24HInCurrency:
            Map.from(json["market_cap_change_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency:
            Map.from(json["market_cap_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json["total_supply"].toDouble(),
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"].toDouble(),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );
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
