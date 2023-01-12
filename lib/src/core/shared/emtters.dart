import 'dart:async';

StreamController<bool> loadingE = StreamController<bool>.broadcast();

Stream<bool> get getStream => loadingE.stream;
