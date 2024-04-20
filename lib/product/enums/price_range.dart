enum PriceRange {
  zeroToHundred(label: '0-100', price: [0.0, 100.0]),
  hundredToTwoHundred(label: '100-200', price: [100.0, 200.0]),
  twoHundredToThousand(label: '200-1000', price: [200.0, 1000.0]);

  const PriceRange({required this.label, required this.price});
  final String label;
  final List<double> price;
}
