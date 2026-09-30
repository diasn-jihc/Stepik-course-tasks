// Sound Null Safety
// ?.. - cascade null-aware operator
void main() {
  Path? path = DateTime.now().millisecond.isEven ? Path() : null;
  path
    ?..moveTo(1, 1)
    ..lineTo(1, 3)
    ..lineTo(3, 3);
}
class Path {
  void moveTo(int x, int y) {}
  void lineTo(int x, int y) {}
}