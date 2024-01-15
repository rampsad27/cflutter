//Calculate the area  and perimeter of Circle and Rectangle. [use abstraction]
abstract class Account {
  //3
  void findArea(int l, int b);
  void findPerimeter(int l, int b);
}

class Rectangle extends Account {
  //2
  @override
  void findArea(int l, int b) {
    //7
    print("area r: ${l * b}");
  }

  @override
  void findPerimeter(int l, int b) {
    //5
    print("Perimeter r: ${2 * l + 2 * b}");
  }
}

class Circle extends Account {
  //2
  @override
  void findArea(int l, int b) {
    //7
    print("area c: ${3.14 * l * l}");
  }

  @override
  void findPerimeter(int l, int b) {
    //5
    print("Perimeter c: ${2 * 3.14 * l}");
  }
}

void main() {
  Rectangle r = Rectangle(); //1
  r.findArea(10, 5); //  4
  r.findPerimeter(10, 5);
  Circle c = Circle(); //1
  c.findArea(3, 0); //  4
  c.findPerimeter(3, 0);
}
