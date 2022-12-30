/// Returns a string with the first letter of each word capitalized.
String? toTitleCase(String? text) {
  if (text == null) {
    return null;
  }

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split the string into words
  final words = text.split(' ');

  // Capitalize the first letter of each word
  for (var i = 0; i < words.length; i++) {
    words[i] = words[i][0].toUpperCase() + words[i].substring(1);
  }

  // Join the words back into a single string
  return words.join(' ');
}
