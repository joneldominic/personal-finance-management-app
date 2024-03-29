extension ListExtension<T> on List<T> {
  String itemsToString() {
    final stringBuffer = StringBuffer();
    final length = this.length;

    stringBuffer.write("[\n");
    for (var i = 0; i < length; i++) {
      stringBuffer.write(this[i].toString());
      if (i != length - 1) stringBuffer.write(", \n");
    }
    stringBuffer.write("\n]");

    return stringBuffer.toString();
  }

  num sumBy(num Function(T element) f) {
    num sum = 0;
    for (var item in this) {
      sum += f(item);
    }
    return sum;
  }
}
