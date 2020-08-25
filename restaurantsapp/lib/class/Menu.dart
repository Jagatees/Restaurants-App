class Menu{
  String Name;
  String ID;
  String ImageURL;

  Menu(this.ID, this.Name, this.ImageURL);

  @override
  String toString() {
    // TODO: implement toString
    return "Menu ID: ${this.ID}, ${this.runtimeType}, Name: ${this.Name}";
  }
}