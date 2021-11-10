const fs = require("fs");
var bodyParser = require("body-parser");
const express = require("express");
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "http://localhost:8080");
  res.header("Access-Control-Allow-Origin", "http://127.0.0.1:8080");
  res.header(
    "Access-Control-Allow-Methods",
    "GET, POST, OPTIONS, PUT, PATCH, DELETE"
  );
  res.header(
    "Access-Control-Allow-Headers",
    "SessionID,Channel,BusinessID,TransactionID,MessageID,InteractionDate-Date,InteractionDate-Time,SourceSystem,DeviceType,ClientVersion,Authorization"
  );
  res.header("Access-Control-Allow-Credentials", "true");
  next();
});

app.get("/api/loginssodca", function (req, res) {
  setTimeout(function () {
    res.json({
      status: "OK",
      tiid: "200000073975",
      _sim: [
        {
          msisdn: "3433434343",
          type: "",
          ambito: "Mobile",
        },
      ],
      sim: [
        {
          msisdn: "0773854999",
          type: "",
          ambito: "Fisso",
        },
        {
          msisdn: "3312624058",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312623474",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312623171",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312624332",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312623052",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312622781",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312623389",
          type: "PP",
          ambito: "Mobile",
        },
        {
          msisdn: "3312623665",
          type: "PP",
          ambito: "Mobile",
        },
      ],
      access_token: "4bbffda1-87bb-4a0c-83c7-61c01b2371ab",
    });
  }, 1000);
});

app.get("/api/ordini/getOrderListByRif", (req, res) => {
  console.log(" orders !!", req.query);
  setTimeout(function () {
    let ordersList = [
      {
        mainLavCom: {
          numeroOrdine: "200000037407",
          statoOrdine: "Completato", //Annullato, In Lavorazione , Sospeso
          nomeOfferta: "TIM CONNECT Fibra",
          dataOrdine: "2018-07-19T06:50:22",
          dataPrevistaAtt: null,
          canaleVendita: "WEB",
          numeroLinea: "0773816421",
          tipo: "main",
          tipoLavCommerciale: "Attivazione",
          lavCommerciale: "Attivazione fisso fibra (NIP)",
        },
        notMainLavCom: [
          {
            offerId: "Servizi OTT",
            numeroLinea: "0",
            statoOrdine: "Non consegnato",
            tipo: "notMain",
            desConsInterv: "il prodotto sara spedito tramite corriere",
          },
          {
            offerId: "773371_RES_TIM HUB",
            numeroLinea: "0",
            statoOrdine: "Non consegnato",
            tipo: "notMain",
            desConsInterv: "il prodotto sara spedito tramite corriere",
          },
        ],
      },
    ];

    //ordersList = [];

    res /* .status(500) */
      .json(ordersList);

    //res.sendStatus(500);
  }, 1200);
});

app.get("/api/v3/coins/markets", function (req, res) {
  setTimeout(function () {
    res.json([
      {
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image:
          "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        current_price: 51829,
        market_cap: 976945857720,
        market_cap_rank: 1,
        fully_diluted_valuation: 1088207279098,
        total_volume: 23717981584,
        high_24h: 53139,
        low_24h: 51659,
        price_change_24h: -1010.466620077314,
        price_change_percentage_24h: -1.91232,
        market_cap_change_24h: -17636136562.054565,
        market_cap_change_percentage_24h: -1.77322,
        circulating_supply: 18852900.0,
        total_supply: 21000000.0,
        max_supply: 21000000.0,
        ath: 57767,
        ath_change_percentage: -10.0631,
        ath_date: "2021-10-20T14:54:17.702Z",
        atl: 51.3,
        atl_change_percentage: 101177.0345,
        atl_date: "2013-07-05T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:50:34.966Z",
      },
      {
        id: "ethereum",
        symbol: "eth",
        name: "Ethereum",
        image:
          "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
        current_price: 3466.73,
        market_cap: 409277172398,
        market_cap_rank: 2,
        fully_diluted_valuation: null,
        total_volume: 14251005134,
        high_24h: 3607.31,
        low_24h: 3457.55,
        price_change_24h: -4.791091705268,
        price_change_percentage_24h: -0.13801,
        market_cap_change_24h: -518578332.5928955,
        market_cap_change_percentage_24h: -0.12655,
        circulating_supply: 118058558.374,
        total_supply: null,
        max_supply: null,
        ath: 3746.89,
        ath_change_percentage: -7.25381,
        ath_date: "2021-10-21T11:34:21.968Z",
        atl: 0.381455,
        atl_change_percentage: 910910.55641,
        atl_date: "2015-10-20T00:00:00.000Z",
        roi: {
          times: 88.43488208138747,
          currency: "btc",
          percentage: 8843.488208138746,
        },
        last_updated: "2021-10-24T14:48:58.500Z",
      },
      {
        id: "binancecoin",
        symbol: "bnb",
        name: "Binance Coin",
        image:
          "https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png?1547034615",
        current_price: 407.75,
        market_cap: 68736566127,
        market_cap_rank: 3,
        fully_diluted_valuation: 68736566127,
        total_volume: 1006545620,
        high_24h: 420.01,
        low_24h: 406.61,
        price_change_24h: -6.470751744653,
        price_change_percentage_24h: -1.56216,
        market_cap_change_24h: -730832045.0574646,
        market_cap_change_percentage_24h: -1.05205,
        circulating_supply: 168137035.9,
        total_supply: 168137035.9,
        max_supply: 168137035.9,
        ath: 564.82,
        ath_change_percentage: -27.62079,
        ath_date: "2021-05-10T07:24:17.097Z",
        atl: 0.03359941,
        atl_change_percentage: 1216626.11556,
        atl_date: "2017-10-19T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:49:09.439Z",
      },
      {
        id: "tether",
        symbol: "usdt",
        name: "Tether",
        image:
          "https://assets.coingecko.com/coins/images/325/large/Tether-logo.png?1598003707",
        current_price: 0.859659,
        market_cap: 60533871957,
        market_cap_rank: 4,
        fully_diluted_valuation: null,
        total_volume: 49628238868,
        high_24h: 0.871314,
        low_24h: 0.856052,
        price_change_24h: 0.00055834,
        price_change_percentage_24h: 0.06499,
        market_cap_change_24h: 39316217,
        market_cap_change_percentage_24h: 0.06499,
        circulating_supply: 70416110814.7674,
        total_supply: 70416110814.7674,
        max_supply: null,
        ath: 1.13,
        ath_change_percentage: -23.97789,
        ath_date: "2018-07-24T00:00:00.000Z",
        atl: 0.533096,
        atl_change_percentage: 61.37182,
        atl_date: "2015-03-02T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:46:35.696Z",
      },
      {
        id: "cardano",
        symbol: "ada",
        name: "Cardano",
        image:
          "https://assets.coingecko.com/coins/images/975/large/cardano.png?1547034860",
        current_price: 1.82,
        market_cap: 58516270607,
        market_cap_rank: 5,
        fully_diluted_valuation: 82118134360,
        total_volume: 1119489539,
        high_24h: 1.87,
        low_24h: 1.82,
        price_change_24h: -0.0365353894,
        price_change_percentage_24h: -1.96588,
        market_cap_change_24h: -961680486.2457275,
        market_cap_change_percentage_24h: -1.61687,
        circulating_supply: 32066390668.4135,
        total_supply: 45000000000.0,
        max_supply: 45000000000.0,
        ath: 2.61,
        ath_change_percentage: -29.99277,
        ath_date: "2021-09-02T06:00:10.474Z",
        atl: 0.01722339,
        atl_change_percentage: 10495.16871,
        atl_date: "2020-03-13T02:22:55.044Z",
        roi: null,
        last_updated: "2021-10-24T14:49:35.261Z",
      },
      {
        id: "solana",
        symbol: "sol",
        name: "Solana",
        image:
          "https://assets.coingecko.com/coins/images/4128/large/coinmarketcap-solana-200.png?1616489452",
        current_price: 162.38,
        market_cap: 48981832145,
        market_cap_rank: 6,
        fully_diluted_valuation: 79525534286,
        total_volume: 2067050132,
        high_24h: 172.76,
        low_24h: 162.01,
        price_change_24h: -8.9402728864,
        price_change_percentage_24h: -5.21846,
        market_cap_change_24h: -2352628995.070839,
        market_cap_change_percentage_24h: -4.58294,
        circulating_supply: 300960223.452581,
        total_supply: 488630611.0,
        max_supply: 488630611.0,
        ath: 183.24,
        ath_change_percentage: -11.21003,
        ath_date: "2021-10-22T15:19:49.190Z",
        atl: 0.46316,
        atl_change_percentage: 35028.62391,
        atl_date: "2020-05-11T19:35:23.449Z",
        roi: null,
        last_updated: "2021-10-24T14:50:01.922Z",
      },
      {
        id: "ripple",
        symbol: "xrp",
        name: "XRP",
        image:
          "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1605778731",
        current_price: 0.931034,
        market_cap: 43708631254,
        market_cap_rank: 7,
        fully_diluted_valuation: 93103366225,
        total_volume: 2769153559,
        high_24h: 0.94785,
        low_24h: 0.925711,
        price_change_24h: -0.009728773205,
        price_change_percentage_24h: -1.03414,
        market_cap_change_24h: -456730382.3903198,
        market_cap_change_percentage_24h: -1.03414,
        circulating_supply: 46946349017.0,
        total_supply: 100000000000.0,
        max_supply: 100000000000.0,
        ath: 2.82,
        ath_change_percentage: -66.96728,
        ath_date: "2018-01-07T00:00:00.000Z",
        atl: 0.00194619,
        atl_change_percentage: 47815.24447,
        atl_date: "2013-08-16T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:48:48.996Z",
      },
      {
        id: "polkadot",
        symbol: "dot",
        name: "Polkadot",
        image:
          "https://assets.coingecko.com/coins/images/12171/large/aJGBjJFU_400x400.jpg?1597804776",
        current_price: 36.36,
        market_cap: 37985144659,
        market_cap_rank: 8,
        fully_diluted_valuation: null,
        total_volume: 928364769,
        high_24h: 38.18,
        low_24h: 36.36,
        price_change_24h: -1.463326847455,
        price_change_percentage_24h: -3.86872,
        market_cap_change_24h: -1377559769.2638092,
        market_cap_change_percentage_24h: -3.49966,
        circulating_supply: 1043069172.24411,
        total_supply: 1124018305.18363,
        max_supply: null,
        ath: 40.63,
        ath_change_percentage: -10.30586,
        ath_date: "2021-05-15T03:59:58.961Z",
        atl: 2.27,
        atl_change_percentage: 1505.85369,
        atl_date: "2020-08-19T03:44:11.556Z",
        roi: null,
        last_updated: "2021-10-24T14:49:24.537Z",
      },
      {
        id: "dogecoin",
        symbol: "doge",
        name: "Dogecoin",
        image:
          "https://assets.coingecko.com/coins/images/5/large/dogecoin.png?1547792256",
        current_price: 0.223469,
        market_cap: 29459470122,
        market_cap_rank: 9,
        fully_diluted_valuation: null,
        total_volume: 2616859332,
        high_24h: 0.230253,
        low_24h: 0.210868,
        price_change_24h: 0.01070674,
        price_change_percentage_24h: 5.03225,
        market_cap_change_24h: 1461657415,
        market_cap_change_percentage_24h: 5.22061,
        circulating_supply: 131827955811.575,
        total_supply: null,
        max_supply: null,
        ath: 0.601466,
        ath_change_percentage: -62.677,
        ath_date: "2021-05-08T05:08:23.458Z",
        atl: 7.662e-5,
        atl_change_percentage: 292898.77108,
        atl_date: "2015-05-06T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:50:00.288Z",
      },
      {
        id: "usd-coin",
        symbol: "usdc",
        name: "USD Coin",
        image:
          "https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png?1547042389",
        current_price: 0.859143,
        market_cap: 27996190829,
        market_cap_rank: 10,
        fully_diluted_valuation: null,
        total_volume: 1677115790,
        high_24h: 0.868429,
        low_24h: 0.856904,
        price_change_24h: -0.003873896727,
        price_change_percentage_24h: -0.44888,
        market_cap_change_24h: -38452968.004463196,
        market_cap_change_percentage_24h: -0.13716,
        circulating_supply: 32579876590.6137,
        total_supply: 32577294652.6937,
        max_supply: null,
        ath: 1.05,
        ath_change_percentage: -17.99341,
        ath_date: "2019-05-08T00:40:28.300Z",
        atl: 0.730265,
        atl_change_percentage: 17.67093,
        atl_date: "2021-05-19T13:14:05.611Z",
        roi: null,
        last_updated: "2021-10-24T14:49:53.474Z",
      },
      {
        id: "shiba-inu",
        symbol: "shib",
        name: "Shiba Inu",
        image:
          "https://assets.coingecko.com/coins/images/11939/large/shiba.png?1622619446",
        current_price: 3.636e-5,
        market_cap: 17923187364,
        market_cap_rank: 11,
        fully_diluted_valuation: null,
        total_volume: 10419650773,
        high_24h: 3.707e-5,
        low_24h: 2.428e-5,
        price_change_24h: 1.207e-5,
        price_change_percentage_24h: 49.67013,
        market_cap_change_24h: 5845991603,
        market_cap_change_percentage_24h: 48.40521,
        circulating_supply: 497730966630395.75,
        total_supply: 1.0e15,
        max_supply: null,
        ath: 3.707e-5,
        ath_change_percentage: -2.74788,
        ath_date: "2021-10-24T11:30:04.067Z",
        atl: 4.7e-11,
        atl_change_percentage: 76771195.43539,
        atl_date: "2020-12-11T05:57:22.476Z",
        roi: null,
        last_updated: "2021-10-24T14:50:16.625Z",
      },
      {
        id: "terra-luna",
        symbol: "luna",
        name: "Terra",
        image:
          "https://assets.coingecko.com/coins/images/8284/large/luna1557227471663.png?1567147072",
        current_price: 35.06,
        market_cap: 14135708764,
        market_cap_rank: 12,
        fully_diluted_valuation: 35211893068,
        total_volume: 456182018,
        high_24h: 37.46,
        low_24h: 35.13,
        price_change_24h: -1.849033826652,
        price_change_percentage_24h: -5.00974,
        market_cap_change_24h: -667925429.7273121,
        market_cap_change_percentage_24h: -4.5119,
        circulating_supply: 401446997.952258,
        total_supply: 970729662.630885,
        max_supply: 1000000000.0,
        ath: 42.78,
        ath_change_percentage: -17.56192,
        ath_date: "2021-10-04T16:35:04.475Z",
        atl: 0.109303,
        atl_change_percentage: 32163.42018,
        atl_date: "2020-03-13T02:24:12.822Z",
        roi: null,
        last_updated: "2021-10-24T14:49:32.688Z",
      },
      {
        id: "avalanche-2",
        symbol: "AVAX",
        name: "Avalanche",
        image:
          "https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png?1604021818",
        current_price: 55.45,
        market_cap: 12226031634,
        market_cap_rank: 13,
        fully_diluted_valuation: 39960413786,
        total_volume: 362610775,
        high_24h: 58.02,
        low_24h: 55.41,
        price_change_24h: -1.341059733747,
        price_change_percentage_24h: -2.36134,
        market_cap_change_24h: -286461132.1772747,
        market_cap_change_percentage_24h: -2.2894,
        circulating_supply: 220286577.207551,
        total_supply: 377752194.4695483,
        max_supply: 720000000.0,
        ath: 67.69,
        ath_change_percentage: -17.88531,
        ath_date: "2021-09-23T08:14:35.857Z",
        atl: 2.28,
        atl_change_percentage: 2335.35686,
        atl_date: "2020-12-31T13:15:21.540Z",
        roi: null,
        last_updated: "2021-10-24T14:49:27.646Z",
      },
      {
        id: "chainlink",
        symbol: "link",
        name: "Chainlink",
        image:
          "https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1547034700",
        current_price: 25.62,
        market_cap: 11833601871,
        market_cap_rank: 14,
        fully_diluted_valuation: 25668886405,
        total_volume: 906780394,
        high_24h: 27.12,
        low_24h: 25.39,
        price_change_24h: -0.953894115447,
        price_change_percentage_24h: -3.59014,
        market_cap_change_24h: -286259730.11597633,
        market_cap_change_percentage_24h: -2.36191,
        circulating_supply: 461009553.9174637,
        total_supply: 1000000000.0,
        max_supply: 1000000000.0,
        ath: 43.32,
        ath_change_percentage: -40.74078,
        ath_date: "2021-05-10T00:13:57.214Z",
        atl: 0.125048,
        atl_change_percentage: 20427.29306,
        atl_date: "2017-11-29T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:50:32.934Z",
      },
      {
        id: "uniswap",
        symbol: "uni",
        name: "Uniswap",
        image:
          "https://assets.coingecko.com/coins/images/12504/large/uniswap-uni.png?1600306604",
        current_price: 22.29,
        market_cap: 11622484927,
        market_cap_rank: 15,
        fully_diluted_valuation: 22357064057,
        total_volume: 228357492,
        high_24h: 23.33,
        low_24h: 22.18,
        price_change_24h: -0.001266092317,
        price_change_percentage_24h: -0.00568,
        market_cap_change_24h: 51590483,
        market_cap_change_percentage_24h: 0.44586,
        circulating_supply: 519857388.1320768,
        total_supply: 1000000000.0,
        max_supply: 1000000000.0,
        ath: 37.37,
        ath_change_percentage: -40.13954,
        ath_date: "2021-05-03T05:25:04.822Z",
        atl: 0.874238,
        atl_change_percentage: 2458.962,
        atl_date: "2020-09-17T01:20:38.214Z",
        roi: null,
        last_updated: "2021-10-24T14:49:31.936Z",
      },
      {
        id: "wrapped-bitcoin",
        symbol: "wbtc",
        name: "Wrapped Bitcoin",
        image:
          "https://assets.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1548822744",
        current_price: 51813,
        market_cap: 11514191987,
        market_cap_rank: 16,
        fully_diluted_valuation: 11514191987,
        total_volume: 374508703,
        high_24h: 53110,
        low_24h: 51687,
        price_change_24h: -1035.976104076603,
        price_change_percentage_24h: -1.96026,
        market_cap_change_24h: -160296998.9644909,
        market_cap_change_percentage_24h: -1.37305,
        circulating_supply: 221692.78993299,
        total_supply: 221692.78993299,
        max_supply: 221692.78993299,
        ath: 57685,
        ath_change_percentage: -9.94383,
        ath_date: "2021-10-20T16:05:47.385Z",
        atl: 2801.21,
        atl_change_percentage: 1754.50904,
        atl_date: "2019-04-02T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:49:29.883Z",
      },
      {
        id: "litecoin",
        symbol: "ltc",
        name: "Litecoin",
        image:
          "https://assets.coingecko.com/coins/images/2/large/litecoin.png?1547033580",
        current_price: 165.5,
        market_cap: 11389756273,
        market_cap_rank: 17,
        fully_diluted_valuation: 13902024516,
        total_volume: 1418599814,
        high_24h: 171.52,
        low_24h: 164.66,
        price_change_24h: -3.083629254627,
        price_change_percentage_24h: -1.82914,
        market_cap_change_24h: -210911435.14720345,
        market_cap_change_percentage_24h: -1.8181,
        circulating_supply: 68820158.2334713,
        total_supply: 84000000.0,
        max_supply: 84000000.0,
        ath: 337.56,
        ath_change_percentage: -50.84105,
        ath_date: "2021-05-10T03:13:07.904Z",
        atl: 0.981314,
        atl_change_percentage: 16810.30182,
        atl_date: "2015-01-14T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:49:49.489Z",
      },
      {
        id: "binance-usd",
        symbol: "busd",
        name: "Binance USD",
        image:
          "https://assets.coingecko.com/coins/images/9576/large/BUSD.png?1568947766",
        current_price: 0.860113,
        market_cap: 11056635972,
        market_cap_rank: 18,
        fully_diluted_valuation: null,
        total_volume: 3634575479,
        high_24h: 0.872224,
        low_24h: 0.85584,
        price_change_24h: -0.002483185676,
        price_change_percentage_24h: -0.28787,
        market_cap_change_24h: -22360652.429050446,
        market_cap_change_percentage_24h: -0.20183,
        circulating_supply: 12864768286.7,
        total_supply: 12864768286.7,
        max_supply: null,
        ath: 1.03,
        ath_change_percentage: -16.69267,
        ath_date: "2020-03-13T02:35:42.953Z",
        atl: 0.73816,
        atl_change_percentage: 16.47778,
        atl_date: "2021-05-19T13:04:37.445Z",
        roi: null,
        last_updated: "2021-10-24T14:50:34.004Z",
      },
      {
        id: "bitcoin-cash",
        symbol: "bch",
        name: "Bitcoin Cash",
        image:
          "https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1594689492",
        current_price: 529.7,
        market_cap: 10025687838,
        market_cap_rank: 19,
        fully_diluted_valuation: 11150711741,
        total_volume: 6840941130,
        high_24h: 544.27,
        low_24h: 530.42,
        price_change_24h: -8.321532073006,
        price_change_percentage_24h: -1.5467,
        market_cap_change_24h: -105202463.2439003,
        market_cap_change_percentage_24h: -1.03843,
        circulating_supply: 18881256.1466529,
        total_supply: 21000000.0,
        max_supply: 21000000.0,
        ath: 3187.12,
        ath_change_percentage: -83.33963,
        ath_date: "2017-12-20T00:00:00.000Z",
        atl: 68.03,
        atl_change_percentage: 680.48631,
        atl_date: "2018-12-16T00:00:00.000Z",
        roi: null,
        last_updated: "2021-10-24T14:49:50.982Z",
      },
      {
        id: "algorand",
        symbol: "algo",
        name: "Algorand",
        image:
          "https://assets.coingecko.com/coins/images/4380/large/download.png?1547039725",
        current_price: 1.58,
        market_cap: 9716887367,
        market_cap_rank: 20,
        fully_diluted_valuation: 15785585701,
        total_volume: 227631911,
        high_24h: 1.67,
        low_24h: 1.57,
        price_change_24h: -0.082636043876,
        price_change_percentage_24h: -4.98144,
        market_cap_change_24h: -411193766.55531883,
        market_cap_change_percentage_24h: -4.05994,
        circulating_supply: 6155544400.73491,
        total_supply: 6620808311.30268,
        max_supply: 10000000000.0,
        ath: 3.15,
        ath_change_percentage: -49.92724,
        ath_date: "2019-06-20T14:51:19.480Z",
        atl: 0.094202,
        atl_change_percentage: 1575.71346,
        atl_date: "2020-03-13T02:20:48.438Z",
        roi: {
          times: -0.23539029567092126,
          currency: "usd",
          percentage: -23.539029567092125,
        },
        last_updated: "2021-10-24T14:49:54.166Z",
      },
    ]);
  }, 1000);
});

let port = 3001;
app.listen(port, () => console.log("Mock app listening on port " + port));
