Stream<int> createStream() async* {
  for (int i = 1; i < 20; i++) {
    //here 20 is size of transmission
    print('$i has been sent.');
    await Future.delayed(const Duration(seconds: 5));
    yield i;
  }
}

void main() {
  Stream noodlestream = createStream();
  noodlestream.listen((noodleIndex) {
    print('Noodle number $noodleIndex has been recieved');
  });
}
