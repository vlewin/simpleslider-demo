// Javascript helpers
String.prototype.capitalize = function() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

String.prototype.string = function () {
  return this.replace('.', '');
};

Number.prototype.px = function () {
  return this + ('px');
};

Array.prototype.last = function () {
  return this[this.length - 1];
}
