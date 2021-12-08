# projectwallet

Per avviare il progetto:
flutter run -d chrome --web-port 8080 --web-renderer html
se va in errore provare ad impostare l'hostname (adattando il mock):
flutter run -d chrome --web-port=8080 --web-renderer html --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/

Lista:

- gestione dati grafico
- fare card info varie pagina dettaglio
- fare card descrizione pagina dettaglio
- il refresh del dettaglio sembra non funzionare
- correggere errore "indietro" dalla home alla login
- ritoccare dettagli card della home
