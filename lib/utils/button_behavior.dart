void Function()? disableButtonIf(bool condition, void Function() action) {
  if (condition) {
    return null;
  } else {
    return action;
  }
}
