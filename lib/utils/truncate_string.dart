String truncateString(String inputString, int index) {
  if (inputString.length <= index) {
    return inputString;
  }

  // Extract the substring up to the specified index
  String truncatedSubstring = inputString.substring(0, index);

  // Add the ellipsis (...) to indicate that the string has been truncated
  String truncatedString = '$truncatedSubstring...';

  return truncatedString;
}
