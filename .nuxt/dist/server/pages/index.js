exports.ids = [4];
exports.modules = {

/***/ 40:
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(44);
if(typeof content === 'string') content = [[module.i, content, '']];
if(content.locals) module.exports = content.locals;
// add CSS to SSR context
var add = __webpack_require__(3).default
module.exports.__inject__ = function (context) {
  add("0bdaa893", content, true, context)
};

/***/ }),

/***/ 42:
/***/ (function(module) {

module.exports = JSON.parse("{\"c\":\"Rafael\",\"d\":\"Mendonça\",\"e\":\"Web developer / Flutter\",\"b\":\"10/07/2001\",\"a\":\"I love to develop \\n for WEB & Flutter\"}");

/***/ }),

/***/ 43:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(40);
/* harmony import */ var _node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));
 /* harmony default export */ __webpack_exports__["default"] = (_node_modules_vue_style_loader_index_js_ref_3_oneOf_1_0_node_modules_css_loader_dist_cjs_js_ref_3_oneOf_1_1_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_3_oneOf_1_2_node_modules_nuxt_components_dist_loader_js_ref_0_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_style_index_0_id_0c0a4fe7_scoped_true_lang_css___WEBPACK_IMPORTED_MODULE_0___default.a); 

/***/ }),

/***/ 44:
/***/ (function(module, exports, __webpack_require__) {

// Imports
var ___CSS_LOADER_API_IMPORT___ = __webpack_require__(2);
var ___CSS_LOADER_GET_URL_IMPORT___ = __webpack_require__(45);
var ___CSS_LOADER_URL_IMPORT_0___ = __webpack_require__(46);
exports = ___CSS_LOADER_API_IMPORT___(false);
var ___CSS_LOADER_URL_REPLACEMENT_0___ = ___CSS_LOADER_GET_URL_IMPORT___(___CSS_LOADER_URL_IMPORT_0___);
// Module
exports.push([module.i, ".line-transform[data-v-0c0a4fe7]{transform:translate(-25px,-50%)}#photo[data-v-0c0a4fe7]{background-image:url(" + ___CSS_LOADER_URL_REPLACEMENT_0___ + ")}", ""]);
// Exports
module.exports = exports;


/***/ }),

/***/ 45:
/***/ (function(module, exports, __webpack_require__) {

"use strict";


module.exports = function (url, options) {
  if (!options) {
    // eslint-disable-next-line no-param-reassign
    options = {};
  } // eslint-disable-next-line no-underscore-dangle, no-param-reassign


  url = url && url.__esModule ? url.default : url;

  if (typeof url !== 'string') {
    return url;
  } // If url is already wrapped in quotes, remove them


  if (/^['"].*['"]$/.test(url)) {
    // eslint-disable-next-line no-param-reassign
    url = url.slice(1, -1);
  }

  if (options.hash) {
    // eslint-disable-next-line no-param-reassign
    url += options.hash;
  } // Should url be wrapped?
  // See https://drafts.csswg.org/css-values-3/#urls


  if (/["'() \t\n]/.test(url) || options.needQuotes) {
    return "\"".concat(url.replace(/"/g, '\\"').replace(/\n/g, '\\n'), "\"");
  }

  return url;
};

/***/ }),

/***/ 46:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__.p + "img/rafael.313a24f.jpg";

/***/ }),

/***/ 53:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./pages/index.vue?vue&type=template&id=0c0a4fe7&scoped=true&
var render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('div',{staticClass:"flex items-center"},[_vm._ssrNode("<div class=\"w-490px flex-grow-0\" data-v-0c0a4fe7><div id=\"photo\" class=\"bg-center bg-white bg-cover bg-no-repeat pb-150 shadow\" data-v-0c0a4fe7></div></div> "),_c('div',{directives:[{name:"mouse-move",rawName:"v-mouse-move"}],staticClass:"flex-1 pl-8 pt-16"},[_vm._ssrNode("<h1 class=\"text-black uppercase font-extrabold text-4xl leading-none mb-5\" data-v-0c0a4fe7>"+_vm._ssrEscape("\n      "+_vm._s(_vm.firstName)+"\n      ")+"<div class=\"relative\" data-v-0c0a4fe7><div class=\"absolute w-120px right-100 top-50 border-blue border-b-5 line-transform\" data-v-0c0a4fe7></div> <span class=\"text-blue\" data-v-0c0a4fe7>"+_vm._ssrEscape(_vm._s(_vm.lastName))+"</span></div></h1> <h2 class=\"mb-2\" data-v-0c0a4fe7>"+_vm._ssrEscape(_vm._s(_vm.position))+"</h2> <p class=\"text-gray\" data-v-0c0a4fe7>"+_vm._ssrEscape("\n      "+_vm._s(_vm.aboutMe)+"\n    ")+"</p>")])],2)}
var staticRenderFns = []


// CONCATENATED MODULE: ./pages/index.vue?vue&type=template&id=0c0a4fe7&scoped=true&

// CONCATENATED MODULE: ./utils/functions.js
const getAge = function (dateString) {
  const today = new Date();
  const birthDate = new Date(dateString);
  let age = today.getFullYear() - birthDate.getFullYear();
  const m = today.getMonth() - birthDate.getMonth();

  if (m < 0 || m === 0 && today.getDate() < birthDate.getDate()) {
    age--;
  }

  return age;
};
const getWindowWidth = function () {
  const el = document.documentElement;
  const body = document.getElementsByTagName('body')[0];
  return window.innerWidth || el.clientWidth || body.clientWidth;
};
const getWindowHeight = function () {
  const el = document.documentElement;
  const body = document.getElementsByTagName('body')[0];
  return window.innerHeight || el.clientHeight || body.clientHeight;
};
// CONCATENATED MODULE: ./utils/directives.js

const mouseMove = {
  inserted(el) {
    const movementStrength = 15;
    const height = movementStrength / getWindowHeight();
    const width = movementStrength / getWindowWidth();
    document.addEventListener('mousemove', function (e) {
      const pageX = e.pageX - getWindowWidth() / 2;
      const pageY = e.pageY - getWindowHeight() / 2;
      const newvalueX = width * pageX * -1;
      const newvalueY = height * pageY * -1;
      const translate = `translate(${newvalueX}px, ${newvalueY}px)`;
      el.style.webkitTransform = translate;
      el.style.MozTransform = translate;
      el.style.msTransform = translate;
      el.style.OTransform = translate;
      el.style.transform = translate;
    });
  }

};
// EXTERNAL MODULE: ./docs/profile.json
var profile = __webpack_require__(42);

// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--2-0!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./pages/index.vue?vue&type=script&lang=js&
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//



/* harmony default export */ var lib_vue_loader_options_pagesvue_type_script_lang_js_ = ({
  directives: {
    mouseMove: mouseMove
  },

  data() {
    return {
      firstName: profile["c" /* firstName */],
      lastName: profile["d" /* lastName */],
      position: profile["e" /* position */],
      aboutMe: profile["a" /* aboutMe */]
    };
  },

  computed: {
    age() {
      return getAge(profile["b" /* birthday */]);
    }

  }
});
// CONCATENATED MODULE: ./pages/index.vue?vue&type=script&lang=js&
 /* harmony default export */ var pagesvue_type_script_lang_js_ = (lib_vue_loader_options_pagesvue_type_script_lang_js_); 
// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js
var componentNormalizer = __webpack_require__(1);

// CONCATENATED MODULE: ./pages/index.vue



function injectStyles (context) {
  
  var style0 = __webpack_require__(43)
if (style0.__inject__) style0.__inject__(context)

}

/* normalize component */

var component = Object(componentNormalizer["a" /* default */])(
  pagesvue_type_script_lang_js_,
  render,
  staticRenderFns,
  false,
  injectStyles,
  "0c0a4fe7",
  "2ce84e06"
  
)

/* harmony default export */ var pages = __webpack_exports__["default"] = (component.exports);

/***/ })

};;
//# sourceMappingURL=index.js.map