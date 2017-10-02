requirejs.config({
    //By default load any module IDs from Scripts/
    baseUrl: '_static/js/',
    //except, if the module ID starts with "app",
    //load it from the js/app directory. paths
    //config is relative to the baseUrl, and
    //never includes a ".js" extension since
    //the paths config could be for a directory.
    paths: {
        boot: '_static/js/bootstrap'

    }
});

//To Do - move to outer file
/**
 * Provides .bind extension for any function over project.
 * usage smth = functionobj.bind(obj_for_this) 
 */
if (!Function.prototype.bind) {
  Function.prototype.bind = function (oThis) {
    if (typeof this !== "function") {
      // closest thing possible to the ECMAScript 5 internal IsCallable function
      throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
    }

    var aArgs = Array.prototype.slice.call(arguments, 1), 
        fToBind = this, 
        fNOP = function () {},
        fBound = function () {
          return fToBind.apply(this instanceof fNOP
                                 ? this
                                 : oThis,
                               aArgs.concat(Array.prototype.slice.call(arguments)));
        };

    fNOP.prototype = this.prototype;
    fBound.prototype = new fNOP();

    return fBound;
  };
}


/**
 * Transforms some object into json aware notation.
 * @param {object} conf Mapping configuration in form oldpropertyname:newpropertyname
 */
$.fn.serializeObject = function(conf)
{
    var mapper = $.extend({}, conf);
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        var mappedname = mapper[this.name]?mapper[this.name]:this.name;
        if (mappedname != null) { 
        if (o[mappedname] !== undefined) {
            if (!o[mappedname].push) {
                o[mappedname] = [o[mappedname]];
            }
            o[mappedname].push(this.value || '');
        } else {
            o[mappedname] = this.value || '';
        }
        }
    });
    return o;
};



