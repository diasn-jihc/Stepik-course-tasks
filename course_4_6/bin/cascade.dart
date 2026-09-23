// Sound Null Safety

// ?.. - cascade null-aware operator

void main() {
  Path? path = DateTime.now().millisecond.isEven ? Path() : null;

  path
    ?..moveTo(0, 0)
    ..lineTo(0, 2)
    ..lineTo(2, 2);
}

class Path {
  void moveTo(int x, int y) {}
  void lineTo(int x, int y) {}
}



//void main() {
//  Path path = Path();

//  path.moveTo(0, 0)
//  path.lineTo(0, 2)
//  path.lineTo(2, 2);
//}

//class Path {
//  void moveTo(int x, int y) {}
//  void lineTo(int x, int y) {}
//}
