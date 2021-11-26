# projectwallet

Per avviare il progetto:
flutter run -d chrome --web-port 8080 --web-renderer html
se va in errore provare ad impostare l'hostname (adattando il mock):
flutter run -d chrome --web-port=8080 --web-renderer html --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/

Lista:

- correggere errore "indietro" dalla home alla login
- fare pagina dettaglio crypto
- ritoccare dettagli card della home
