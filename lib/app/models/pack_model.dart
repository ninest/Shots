class PackModel {
  final String name;

  // only one of the below will be given
  final String filename;
  final String url;

  final bool selected;

  PackModel({this.name, this.filename, this.url, this.selected = false});

  PackModel select() {
    return PackModel(name: name, filename: filename, url: url, selected: true);
  }

  PackModel remove() {
    return PackModel(name: name, filename: filename, url: url, selected: false);
  }
}
