// ignore: camel_case_types
class listItem {
  String _name;
  String _count;
  var _icon;

  listItem(this._name, this._count, this._icon);

  get icon => _icon;

  String get count => _count;

  String get name => _name;
}
