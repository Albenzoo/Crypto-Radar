# projectwallet

Per avviare il progetto:
flutter run -d chrome --web-port 8080 --web-renderer html
se va in errore provare ad impostare l'hostname (adattando il mock):
flutter run -d chrome --web-port=8080 --web-renderer html --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/

Lista:

- fare card grafico pagina dettaglio
  https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=eur&days=30&interval=daily
- fare card info varie pagina dettaglio
- fare card descrizione pagina dettaglio
- correggere errore "indietro" dalla home alla login
- ritoccare dettagli card della home
