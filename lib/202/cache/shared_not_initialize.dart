

class SharedNotIninializeException implements Exception{
  @override
  String toString() {
    return 'your preferences not initialize right now';
  }
}