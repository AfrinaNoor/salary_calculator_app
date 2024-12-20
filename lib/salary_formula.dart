double calculateSalary(int hours) {
  if (hours < 0) {
    return 0; // Return 0 for invalid input
  }
  if (hours <= 40) {
    return (hours * 400).toDouble(); // Ensure consistent type
  } else {
    return (40 * 400 + (hours - 40) * 600).toDouble(); // Consistent return type
  }
}
