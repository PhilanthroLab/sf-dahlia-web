/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import './stylesheets.scss'
import 'lodash/lodash.min.js'
import 'angular/angular.min.js'
import 'angular-foundation/mm-foundation-tpls.js'
import 'angular-ui-router/release/angular-ui-router.min.js'
import 'angular-ui-router-title/angular-ui-router-title.js'
// import 'angular-rails-templates'
import 'angular-pageslide-directive/dist/angular-pageslide-directive.min.js'
import 'ngstorage/ngStorage.min.js'
import 'angular-sanitize/angular-sanitize.min.js'
import 'angular-clipboard/angular-clipboard.js'
import 'angular-filter/dist/angular-filter.min.js'
import 'angular-translate/dist/angular-translate.min.js'
import 'angular-translate-loader-static-files'
import 'angular-carousel/angular-carousel.min.js'
import 'angular-ui-mask'
import 'hammerjs'
import 'ng-currency/dist/ng-currency.min.js'
import 'ng-text-truncate/ng-text-truncate.js'
import 'moment/min/moment.min.js'
import 'moment-timezone/builds/moment-timezone-with-data.min.js'
import 'js-yaml/dist/js-yaml.min.js'
import 'ng-file-upload/dist/ng-file-upload.min.js'
import 'angular-aria'
import 'angular-scroll/angular-scroll.min.js'
import 'ng-idle'
import 'angular-cookie/angular-cookie.min.js'
import 'ng-token-auth/dist/ng-token-auth.min.js'
import 'angular-ui-validate/dist/validate.min.js'
import 'angular-uuid/angular-uuid.js'
import 'angular-linkify/angular-linkify.min.js'
import 'angular-messages'
import 'angular-loading-overlay'
import 'angular-http-etag/release/angular-http-etag.js'
import 'ng-meta/dist/ngMeta.min.js'
import 'raven-js/dist/raven.min.js'
import 'raven-js/dist/plugins/angular'
import 'application/config/angularModules.js'
import 'application/config/angularRoutes.js'
import 'application/config/angularProviders.js'
import 'application/config/angularInitialize.js'
import 'application/config/angularConstants.js'
import 'application/customFilters.js'
// SERVICES
import 'application/shared/SharedService.js'
import 'application/shared/AnalyticsService.js'
import 'application/short-form/ShortFormApplicationService.js'
import 'application/short-form/AddressValidationService.js'
import 'application/short-form/FileUploadService.js'
import 'application/listings/ListingPreferenceService.js'
import 'application/listings/ListingConstantsService.js'
import 'application/listings/ListingIdentityService.js'
import 'application/short-form/RentBurdenFileService.js'
import 'application/listings/ListingDataService.js'
import 'application/shared/ExternalTranslateService.js'
import 'application/listings/ListingEligibilityService.js'
import 'application/listings/ListingUnitService.js'
import 'application/listings/ListingLotteryService.js'
import 'application/shared/ModalService.js'
import 'application/income-calculator/IncomeCalculatorService.js'
import 'application/short-form/ShortFormHelperService.js'
import 'application/short-form/GISService.js'
import 'application/short-form/ShortFormDataService.js'
import 'application/account/AccountService.js'
import 'application/short-form/ShortFormNavigationService.js'
import 'application/short-form/AutosaveService.js'
//CONTROLLERS
import 'application/shared/SharedController.js'
import 'application/shared/NavController.js'
//COMPONENTS
import 'application/listings/components/listingContainer.js'
import 'application/listings/components/welcomeComponent.js'
import 'application/shared/components/languageSwitcher.js'

// require
// function requireAll(r) { r.keys().forEach(r) }
// requireAll(require.context('../application/account', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/directives', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/income-calculator', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/listings', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/pages', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/shared', true, /\.(js|coffee)$/))
// requireAll(require.context('../application/short-form', true, /\.(js|coffee)$/))
//= require_tree .