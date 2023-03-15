# Crypto-Radar

Flutter web application that allows users to view the current values of cryptocurrencies. Users can view a list of cryptocurrencies, with the current value of each, and select one to view more information. Specifically, users can view a description of the selected cryptocurrency and a chart that shows the value of the cryptocurrency over time.

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


