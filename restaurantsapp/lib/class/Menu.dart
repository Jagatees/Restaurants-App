class Menu{
  String Name;
  String ID;

  Menu(this.ID, this.Name);

  @override
  String toString() {
    // TODO: implement toString
    return "Menu ID: ${this.ID}, ${this.runtimeType}, Name: ${this.Name}";
  }
}