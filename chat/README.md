# chat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Nel mio programma per entrare nella chat bisogna inserire un nome che sarà il nome con cui gl'altri ti visualizzeranno.
Ciò su cui ho lavorato di più è stato lo streamBuilder(dove vedo se ci sono nuovi messaggi e dove faccio vedere i messaggi) in cui ho dovuto capire bene il modo per usarlo al meglio e modificarlo varie volte per riuscire a far vedere all'utente tutti messaggi che invio e che ho inviato. Alla fine sono riuscito a capire il ragionamento e a sapere quando entrare nelle funzioni per cambiare l'interfaccia.

Altri punti in cui ho dovuto lavoraci molto sono state le due funzioni visualizza() e sendMessage() dove ho dovuto giostare le variabili booleane o le stringe di supporto per i messaggi in arrivo che devono essere scritti o gli invii del messaggi e finalmente per modificare l'interfaccia e mostrarli all'utente.
Nella funzione visualizza() cambio l'interfaccia nello streambuilder quando mi arriva un messaggio, mentre nel sendMessage() cambio l'interfaccia nello streambuilder quando invio un messaggio.

Ho dovuto spenderci veramente molto tempo solo per capire i meccanismi dei socket e di come visualizzare tutti messaggi e dopo molto tempo sono riuscito a finirla.


Antonio Alliaj