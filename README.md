# projectwallet

Per avviare il progetto:
flutter run -d chrome --web-port 8080 --web-renderer html
se va in errore provare ad impostare l'hostname (adattando il mock):
flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/

Lista:

- gestire meglio la chip delle card, fare una funzione che ritorna il widget intero
- correggere errore "indietro" dalla home alla login
- fare per bene le card della home
- inserire spinner loading
- fare pagina dettaglio crypto
