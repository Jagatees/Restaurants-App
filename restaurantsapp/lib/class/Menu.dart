class Menu{
  String Name;
  String ID;
  String ImageURL;
  double Price;

  Menu(this.ID, this.Name, this.ImageURL, this.Price);

  @override
  String toString() {
    // TODO: implement toString
    return "Menu ID: ${this.ID}, ${this.runtimeType}, Name: ${this.Name}";
  }
}