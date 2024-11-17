class UtilsAmont {
  static RegExp domainExp = RegExp(r"^[0-9]+([.][0-9]?[0-9])?$");

  static String amotTotal(int amont, double? popina) =>
      ((amont / 100) + (popina ?? 0)).toStringAsFixed(2);

  static String amontCustom(int amont) => (amont / 100).toStringAsFixed(2);
  static int amont(String amont) {
    final newAmont = ((double.tryParse(amont) ?? 0) * (100));
    print(newAmont.toInt());

    return newAmont.toInt();
  }

  static String? validtesAmont(String name) {
    final resp = domainExp.hasMatch(name) ? null : 'Ingrese un dato valido';
    return resp;
  }
}
