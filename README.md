# projectwallet
Per avviare il progetto con renderer CanvasKit (modalità standard - possono esserci problemi di CORS):
flutter run -d chrome --web-port 8080

Per avviare il progetto con renderer Html:
flutter run -d chrome --web-port 8080 --web-renderer html

se va in errore provare ad impostare l'hostname (adattando il res.header del mock), es.:
flutter run -d chrome --web-port=8080 --web-renderer html --web-hostname=127.0.0.1

Per aggiornare la pagina cliccare "r" sul terminale

Per avviare il mock:
nodemon mocks/


