extension StringExtensions on String {
  bool get isValidMobileNumber => RegExp(r'^\d{10,15}$').hasMatch(this);
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(this);
}
