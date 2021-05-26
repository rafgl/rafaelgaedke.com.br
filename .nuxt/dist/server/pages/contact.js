exports.ids = [3];
exports.modules = {

/***/ 41:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__.p + "img/mapmarker.daf5d47.png";

/***/ }),

/***/ 49:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./components/FormField.vue?vue&type=template&id=27609334&
var render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('div',{staticClass:"relative"},[_vm._t("default",[_c(_vm.component,_vm._g({tag:"component",staticClass:"bg-transparent outline-none w-full",attrs:{"type":_vm.type}},{
        $listeners: _vm.$listeners,
        input: function ($event) { return _vm.$emit('input', $event.target.value); }
      }))]),_vm._ssrNode(" <label class=\"text-gray absolute top-0 left-0 block\">"+_vm._ssrEscape(_vm._s(_vm.label))+"</label> <div class=\"border border-gray\"></div>")],2)}
var staticRenderFns = []


// CONCATENATED MODULE: ./components/FormField.vue?vue&type=template&id=27609334&

// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--2-0!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./components/FormField.vue?vue&type=script&lang=js&
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
/* harmony default export */ var FormFieldvue_type_script_lang_js_ = ({
  props: {
    label: {
      type: String,
      required: true
    },
    type: {
      type: String,
      default: 'text'
    },
    value: {
      required: true,
      type: [String, Number]
    }
  },
  computed: {
    component() {
      if (this.type === 'textarea') {
        return 'textarea';
      }

      return 'input';
    }

  }
});
// CONCATENATED MODULE: ./components/FormField.vue?vue&type=script&lang=js&
 /* harmony default export */ var components_FormFieldvue_type_script_lang_js_ = (FormFieldvue_type_script_lang_js_); 
// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js
var componentNormalizer = __webpack_require__(1);

// CONCATENATED MODULE: ./components/FormField.vue





/* normalize component */

var component = Object(componentNormalizer["a" /* default */])(
  components_FormFieldvue_type_script_lang_js_,
  render,
  staticRenderFns,
  false,
  null,
  null,
  "3a726e8e"
  
)

/* harmony default export */ var FormField = __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ 50:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./components/GoogleMaps.vue?vue&type=template&id=fe296792&
var render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('div',[])}
var staticRenderFns = []


// CONCATENATED MODULE: ./components/GoogleMaps.vue?vue&type=template&id=fe296792&

// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--2-0!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./components/GoogleMaps.vue?vue&type=script&lang=js&
//
//
//
//
/* harmony default export */ var GoogleMapsvue_type_script_lang_js_ = ({
  props: {
    lat: {
      type: Number,
      required: true
    },
    lng: {
      type: Number,
      required: true
    },
    zoom: {
      type: Number,
      default: 10
    },
    icon: {
      type: String,
      default: __webpack_require__(41)
    }
  },

  mounted() {
    this.registerGoogleAPIScript();

    window.initMap = () => {
      this.createMap();
    };
  },

  methods: {
    async createMap() {
      const google = await window.google;
      const zoom = this.zoom;
      const position = {
        lat: this.lat,
        lng: this.lng
      };
      const map = new google.maps.Map(this.$el, {
        zoom,
        center: position,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        styles: [{
          featureType: 'all',
          elementType: 'labels.text.fill',
          stylers: [{
            saturation: 36
          }, {
            color: '#2b303a'
          }, {
            lightness: 40
          }]
        }, {
          featureType: 'all',
          elementType: 'labels.text.stroke',
          stylers: [{
            visibility: 'on'
          }, {
            color: '#2b303a'
          }, {
            lightness: '-34'
          }]
        }, {
          featureType: 'all',
          elementType: 'labels.icon',
          stylers: [{
            visibility: 'off'
          }]
        }, {
          featureType: 'administrative',
          elementType: 'geometry.fill',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 20
          }]
        }, {
          featureType: 'administrative',
          elementType: 'geometry.stroke',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 17
          }, {
            weight: 1.2
          }]
        }, {
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [{
            color: '#2b303a'
          }, {
            lightness: '-10'
          }]
        }, {
          featureType: 'poi',
          elementType: 'geometry',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 21
          }]
        }, {
          featureType: 'road.highway',
          elementType: 'geometry.fill',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 17
          }]
        }, {
          featureType: 'road.highway',
          elementType: 'geometry.stroke',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 29
          }, {
            weight: 0.2
          }]
        }, {
          featureType: 'road.arterial',
          elementType: 'geometry',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 18
          }]
        }, {
          featureType: 'road.local',
          elementType: 'geometry',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 16
          }]
        }, {
          featureType: 'transit',
          elementType: 'geometry',
          stylers: [{
            color: '#000000'
          }, {
            lightness: 19
          }]
        }, {
          featureType: 'water',
          elementType: 'geometry',
          stylers: [{
            color: '#2b303a'
          }, {
            lightness: '0'
          }, {
            gamma: '1'
          }]
        }]
      }); // eslint-disable-next-line

      new google.maps.Marker({
        position,
        map,
        icon: this.icon
      });
    },

    async registerGoogleAPIScript() {
      const script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyAJCZDj3_UBJsd7v3GQJsprfjQjtmdY1Uw&callback=initMap';
      script.async = true;
      script.defer = true;
      await document.body.appendChild(script);
    }

  }
});
// CONCATENATED MODULE: ./components/GoogleMaps.vue?vue&type=script&lang=js&
 /* harmony default export */ var components_GoogleMapsvue_type_script_lang_js_ = (GoogleMapsvue_type_script_lang_js_); 
// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js
var componentNormalizer = __webpack_require__(1);

// CONCATENATED MODULE: ./components/GoogleMaps.vue





/* normalize component */

var component = Object(componentNormalizer["a" /* default */])(
  components_GoogleMapsvue_type_script_lang_js_,
  render,
  staticRenderFns,
  false,
  null,
  null,
  "684222a8"
  
)

/* harmony default export */ var GoogleMaps = __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ 54:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./pages/contact.vue?vue&type=template&id=b400e90c&
var render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('div',{staticClass:"flex"},[_vm._ssrNode("<div class=\"w-490px flex-grow-0\">","</div>",[_vm._ssrNode("<form class=\"bg-black shadow p-10 mb-10\">","</form>",[_vm._ssrNode("<p class=\"text-white text-xl font-bold mb-10\">Send a message</p> "),_c('form-field',{staticClass:"mb-8",attrs:{"label":"Your Name","type":"text"},model:{value:(_vm.form.name),callback:function ($$v) {_vm.$set(_vm.form, "name", $$v)},expression:"form.name"}}),_vm._ssrNode(" "),_c('form-field',{staticClass:"mb-8",attrs:{"label":"Your Email","type":"email"},model:{value:(_vm.form.email),callback:function ($$v) {_vm.$set(_vm.form, "email", $$v)},expression:"form.email"}}),_vm._ssrNode(" "),_c('form-field',{staticClass:"mb-8",attrs:{"label":"Your Message","type":"textarea"},model:{value:(_vm.form.message),callback:function ($$v) {_vm.$set(_vm.form, "message", $$v)},expression:"form.message"}}),_vm._ssrNode(" <button class=\"uppercase text-white font-black tracking-widest w-full text-center p-3 rounded-full bg-blue\">\n        Send\n      </button>")],2),_vm._ssrNode(" "),_c('google-maps',{staticClass:"h-300px",attrs:{"lat":56.484392,"lng":21.017387,"zoom":4}})],2),_vm._ssrNode(" <div class=\"flex-1 pl-8\"><div class=\"max-w-3/5\"><h1 class=\"uppercase text-4xl font-black leading-none mb-10\">\n        Contact me\n      </h1> <div class=\"p-6 shadow-lighter mb-8\"><p class=\"font-bold mb-2\">Email</p> <a href=\"mailto:rafael.luan.gaedke@hotmail.com\" class=\"hover:underline\">rafael.luan.gaedke@hotmail.com</a></div> <div class=\"p-6 mb-8\"><p class=\"font-bold mb-2\">Telefone</p> <a href=\"tel:+5547997017721\" class=\"hover:underline\">47997017721</a></div> <div class=\"p-6\"><p class=\"font-bold mb-2\">Addresss</p> <p>Mirdzas Kempes 3, Liepaja, Latvia, LV-3407</p></div></div></div>")],2)}
var staticRenderFns = []


// CONCATENATED MODULE: ./pages/contact.vue?vue&type=template&id=b400e90c&

// CONCATENATED MODULE: ./node_modules/babel-loader/lib??ref--2-0!./node_modules/@nuxt/components/dist/loader.js??ref--0-0!./node_modules/vue-loader/lib??vue-loader-options!./pages/contact.vue?vue&type=script&lang=js&
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
/* harmony default export */ var contactvue_type_script_lang_js_ = ({
  data() {
    return {
      form: {
        name: '',
        email: '',
        message: ''
      }
    };
  }

});
// CONCATENATED MODULE: ./pages/contact.vue?vue&type=script&lang=js&
 /* harmony default export */ var pages_contactvue_type_script_lang_js_ = (contactvue_type_script_lang_js_); 
// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js
var componentNormalizer = __webpack_require__(1);

// CONCATENATED MODULE: ./pages/contact.vue





/* normalize component */

var component = Object(componentNormalizer["a" /* default */])(
  pages_contactvue_type_script_lang_js_,
  render,
  staticRenderFns,
  false,
  null,
  null,
  "f5450958"
  
)

/* harmony default export */ var contact = __webpack_exports__["default"] = (component.exports);

/* nuxt-component-imports */
installComponents(component, {FormField: __webpack_require__(49).default,GoogleMaps: __webpack_require__(50).default})


/***/ })

};;
//# sourceMappingURL=contact.js.map