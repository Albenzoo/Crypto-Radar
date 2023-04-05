# Crypto-Radar

Flutter-web based tool for monitoring and analyzing cryptocurrency prices and market data.
With Crypto-Radar, you can easily track the latest prices, trading volumes, and market trends for a wide range of cryptocurrencies,
including Bitcoin, Ethereum, Litecoin, and many others.
The tool provides a user-friendly interface for viewing charts and graphs that display historical and current market data,
and it also allows you to see the description and the main infos of every cryptocurrencies supported.
Crypto-Radar uses APIs from coinGecko to ensure accurate and up-to-date information. Whether you're a seasoned cryptocurrency trader or
just getting started in the world of digital assets, Crypto-Radar is a tool that can help you stay updated with the latest market developments.

The application is based on Flutter Web, an open-source framework for developing mobile and web apps, using the Dart programming language.

To retrieve the current values of cryptocurrencies, the web app connects to an external data source, the CoinGecko cryptocurrency API.

The addition of the description and value chart of selected cryptocurrencies allows users to obtain more information about cryptocurrencies and make more informed investment decisions.


## Project startup
Per avviare il progetto con renderer CanvasKit (modalità standard - possono esserci problemi di CORS):
flutter run -d chrome --web-port 8080

Per avviare il progetto con renderer Html:
flutter run -d chrome --web-port 8080 --web-renderer html

se va in errore provare ad impostare l'hostname (adattando il res.header del mock), es.:
flutter run -d chrome --web-port=8080 --web-renderer html --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/


