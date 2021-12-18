String persentagae(String value, double persent) {
  return (double.parse(value) - (persent * double.parse(value)))
      .toStringAsFixed(0);
}
