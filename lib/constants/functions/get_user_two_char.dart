String getUserTwoChar(String name) {
  var splitted = name.split(' ');
  if (splitted.length >= 2) {
    return splitted[0][0] + splitted[1][0];
  }
  return name[0] + name[1];
}
