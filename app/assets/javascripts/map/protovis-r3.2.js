/**
 * @class The built-in Array class.
 * @name Array
 */

/**
 * Creates a new array with the results of calling a provided function on every
 * element in this array. Implemented in Javascript 1.6.
 *
 * @function
 * @name Array.prototype.map
 * @see <a
 * href="https://developer.mozilla.org/En/Core_JavaScript_1.5_Reference/Objects/Array/Map">map</a>
 * documentation.
 * @param {function} f function that produces an element of the new Array from
 * an element of the current one.
 * @param [o] object to use as <tt>this</tt> when executing <tt>f</tt>.
 */
if (!Array.prototype.map) Array.prototype.map = function(f, o) {
  var n = this.length;
  var result = new Array(n);
  for (var i = 0; i < n; i++) {
    if (i in this) {
      result[i] = f.call(o, this[i], i, this);
    }
  }
  return result;
};