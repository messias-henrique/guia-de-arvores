void main() {
  final string = "A;B;C;D;E;F;G;H";
  final a = string.split(';');
  for (var i = 0; i < a.length; i++) {
    print(a[i]);
  }
}
