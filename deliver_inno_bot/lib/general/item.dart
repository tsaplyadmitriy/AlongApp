class Item {
  String name;
  int number;
  int priceMin;
  int priceMax;
  Item({
    this.name = '',
    this.number,
    this.priceMin,
    this.priceMax,
  });

  static Item getDefaultItem(){
    return Item(
        name: "DefaultItem",
        number:1,
        priceMin:100,
        priceMax:200);


  }

  bool get correct =>
      (number != null &&
          (priceMin != null && priceMin > 0 ||
              priceMax != null && priceMax > 0)) &&
          (name.isNotEmpty && number > 0);

  @override
  bool operator ==(Object o) {
    return o is Item &&
        o.name == name &&
        o.number == number &&
        o.priceMin == priceMin &&
        o.priceMax == priceMax;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    number.hashCode ^
    priceMin.hashCode ^
    priceMax.hashCode;
  }

  Item copyWith({
    String name,
    String number,
    String priceMin,
    String priceMax,
  }) {
    return Item(
      name: name == null ? this.name : name,
      number: number == null ? this.number : _parse(number),
      priceMin: priceMin == null ? this.priceMin : _parse(priceMin),
      priceMax: priceMax == null ? this.priceMax : _parse(priceMax),
    );
  }

  int _parse(String str) {
    int numberParsed;
    try {
      numberParsed = str.isEmpty ? null : int.parse(str);
    } catch (Exception) {
      numberParsed = null;
    }
    return numberParsed;
  }

  @override
  String toString() {
    return 'Item(name: $name, number: $number, priceMin: $priceMin, priceMax: $priceMax)';
  }
}