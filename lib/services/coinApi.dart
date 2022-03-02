import 'package:http/http.dart';
import 'dart:convert';

class CoinApi {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final int? currentPrice;
  final int? marketCap;
  final int? marketCapRank;
  final int? fullyDilutedValuation;
  final int? totalVolume;
  final int? high24h;
  final int? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final int? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final int? circulatingSupply;
  final int? totalSupply;
  final int? maxSupply;
  final int? ath;
  final double? athChangePercentage;
  final String? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final String? atlDate;
  final dynamic roi;
  final String? lastUpdated;

  CoinApi({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  CoinApi.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        symbol = json['symbol'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        currentPrice = json['current_price'] as int?,
        marketCap = json['market_cap'] as int?,
        marketCapRank = json['market_cap_rank'] as int?,
        fullyDilutedValuation = json['fully_diluted_valuation'] as int?,
        totalVolume = json['total_volume'] as int?,
        high24h = json['high_24h'] as int?,
        low24h = json['low_24h'] as int?,
        priceChange24h = json['price_change_24h'] as double?,
        priceChangePercentage24h =
            json['price_change_percentage_24h'] as double?,
        marketCapChange24h = json['market_cap_change_24h'] as int?,
        marketCapChangePercentage24h =
            json['market_cap_change_percentage_24h'] as double?,
        circulatingSupply = json['circulating_supply'] as int?,
        totalSupply = json['total_supply'] as int?,
        maxSupply = json['max_supply'] as int?,
        ath = json['ath'] as int?,
        athChangePercentage = json['ath_change_percentage'] as double?,
        athDate = json['ath_date'] as String?,
        atl = json['atl'] as double?,
        atlChangePercentage = json['atl_change_percentage'] as double?,
        atlDate = json['atl_date'] as String?,
        roi = json['roi'],
        lastUpdated = json['last_updated'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'market_cap': marketCap,
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': fullyDilutedValuation,
        'total_volume': totalVolume,
        'high_24h': high24h,
        'low_24h': low24h,
        'price_change_24h': priceChange24h,
        'price_change_percentage_24h': priceChangePercentage24h,
        'market_cap_change_24h': marketCapChange24h,
        'market_cap_change_percentage_24h': marketCapChangePercentage24h,
        'circulating_supply': circulatingSupply,
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'ath': ath,
        'ath_change_percentage': athChangePercentage,
        'ath_date': athDate,
        'atl': atl,
        'atl_change_percentage': atlChangePercentage,
        'atl_date': atlDate,
        'roi': roi,
        'last_updated': lastUpdated
      };
}

class CoinService {
  Future<CoinApi> getCoinApi() async {
    final response = await get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false#'));
    // var jsonString = response.body;
    // var jsonMap = json.decode(jsonString);
    // final activity = CoinApi.fromJson(jsonMap);
    var activity = CoinApi.fromJson(json.decode(response.body)[0]);
    print(activity);
    return activity;
  }
}
