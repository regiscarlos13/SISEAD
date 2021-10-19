require("@rails/ujs").start()

//require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("trix")
require("@rails/actiontext")



import $ from 'jquery'
global.$ = $
global.jQuery = $



import 'bootstrap';
//require( 'datatables.net-bs4' )();
//require( 'datatables.net-responsive-bs4' )();
import '../src/application';
import "@fortawesome/fontawesome-free/js/all";
import './flashmenssages';
//import './index_datatables';
import './direct_uploads';
import 'cocoon-js'

import "controllers"
