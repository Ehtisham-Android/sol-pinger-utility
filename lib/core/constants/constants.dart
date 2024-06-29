import 'package:flutter/material.dart';

import '../Utils.dart';

class Urls {
  static const currentWeatherEndpoint =
      'https://api.weatherapi.com/v1/forecast.json?key=384676e3678a47cfbe6173913230109&q=Jeddah&days=1&aqi=no&alerts=no';

  static const HOME_PAGE_API =
      'rest/{storeCode}/V1/fifo/homePageData?currency={currency}&width={width}&mFactor={mFactor}&isFromUrl={isFromUrl}';

  // Category page data
  static const CATEGORY_DATA_V1 =
      '/rest/{storeCode}/V1/fifo/categoryPageData?currency={currency}&width={width}&mFactor={mFactor}&categoryId={categoryId}';

  static const WEBSITES_API = 'mobikulhttp/website/getwebsites';
  static const VALIDATE_PHONE_NUMBER =
      'mobikulcustomhttp/customer/ValidatePhoneNumber';
  static const VALIDATE_EMAIL_ADDRESS =
      'mobikulhttp/customer/ValidateEmailAddress';
  static const SEND_OTP = "mobikulcustomhttp/customer/sendOtp";
  static const VERIFY_OTP = "mobikulcustomhttp/customer/verifyOtp";
  static const CREATE_ACCOUNT = "mobikulhttp/customer/createAccount";

  // Orders
  static const MOBIKUL_CUSTOMER_ORDER_LIST = "mobikulhttp/customer/orderList";
  static const MOBIKUL_CUSTOMER_ORDER_DETAIL = "mobikulhttp/customer/orderDetails";
  static const MOBIKUL_CUSTOMER_VIEW_INVOICE = "mobikulhttp/customer/invoiceview";
  static const MOBIKUL_CUSTOMER_VIEW_REFUND = "mobikulhttp/customer/creditview";
  static const MOBIKUL_CUSTOMER_VIEW_SHIPMENT = "mobikulhttp/customer/shipmentview";

  // Address book
  static const MOBIKUL_CUSTOMER_GET_ADDRESS_BOOK_DATA = "mobikulhttp/customer/addressBookData";

  // Checkout address
  static const MOBIKUL_CHECKOUT_ADDRESS_INFO = "mobikulhttp/checkout/checkoutaddress";
  static const MOBIKUL_CUSTOMER_DELETE_ADDRESS = "mobikulhttp/customer/deleteAddress";
  static const MOBIKUL_CUSTOMER_SAVE_ADDRESS = "mobikulhttp/customer/saveAddress";
  static const MOBIKUL_CUSTOMER_ADDRESS_FORM_DATA = "mobikulhttp/customer/addressformData";

  // Checkout
  static const MOBIKUL_CHECKOUT_ADD_TO_CART = "mobikulhttp/checkout/addtoCart";
  static const MOBIKUL_CHECKOUT_UPDATE_ITEM_OPTION = "mobikulhttp/checkout/updateitemoptions";
  static const MOBIKUL_CHECKOUT_CART_DETAILS = "mobikulhttp/checkout/cartDetails";
  static const MOBIKUL_CHECKOUT_WISH_LIST_FROM_CART = "mobikulhttp/checkout/wishlistfromCart";
  static const MOBIKUL_CHECKOUT_REMOVE_CART_ITEM = "mobikulhttp/checkout/removeCartItem";
  static const MOBIKUL_CHECKOUT_APPLY_COUPON = "mobikulhttp/checkout/applyCoupon";
  static const MOBIKUL_CHECKOUT_UPDATE_CART = "mobikulhttp/checkout/updateCart";
  static const MOBIKUL_CHECKOUT_EMPTY_CART = "mobikulhttp/checkout/emptyCart";
  static const MOBIKUL_CHECKOUT_SHIPPING_METHODS = "mobikulhttp/checkout/shippingmethods";
  static const MOBIKUL_PAYMENT_METHODS = "mobikulhttp/checkout/paymentmethods";
  static const MOBIKUL_CHECKOUT_REVIEWS_AND_PAYMENTS = "mobikulhttp/checkout/reviewandpayment";
  static const MOBIKUL_CHECKOUT_PLACE_ORDER = "mobikulhttp/checkout/placeorder";
  static const MOBIKUL_CHECKOUT_GET_SDK_TOKEN = "mobikulhttp/checkout/PayfortToken";
  static const MOBIKUL_CHECKOUT_CHANGE_ORDER_STATUS = "mobikulhttp/checkout/changeOrderStatus";
  static const MOBIKUL_HYPERPAY_ORDER_STATUS = "mobikulhttp/checkout/HyperpayStatus";
  static const MOBIKUL_CHECKOUT_WALLET_PLACE_ORDER = "mobikulhttp/checkout/walletplaceorder";

  // Wallet
  static const MOBIKUL_CUSTOMER_WALLET_PAYMENT_METHODS = "mobikulhttp/checkout/WalletPaymentMethods";
  static const SET_OR_RESET_WALLET = "mobikulhttp/checkout/applypaymentamount";

  // Wishlist
  static const MOBIKUL_CUSTOMER_WISH_LIST = "mobikulhttp/customer/wishList";
  static const MOBIKUL_CATALOG_ADD_TO_WISH_LIST = "mobikulhttp/catalog/addtoWishlist";
  static const MOBIKUL_CUSTOMER_REMOVE_FROM_WISH_LIST = "mobikulhttp/customer/removefromWishlist";

}

const String FREE_SHIPPING_CODE = "freeshipping_freeshipping";

const String expressLogoString = '''
<svg id="vector" xmlns="http://www.w3.org/2000/svg" width="363.21" height="89.68" viewBox="0 0 363.21 89.68">
    <path fill="#e8cc00" d="M40.09,38.24c0.27,0 0.55,0 0.82,-0.05h15.3c0.27,0 0.54,0 0.81,0.05a6.4,6.4 0,0 1,1.58 0.38,5.11 5.11,0 0,1 3.48,5.77 5.67,5.67 0,0 1,-4.25 3.91c-0.27,0.06 -0.54,0.09 -0.81,0.14l-0.81,0.05H40.91a6.77,6.77 0,0 1,-1.62 -0.19,7.11 7.11,0 0,1 -1.5,-0.56A5,5 0,0 1,35 42.29,5.81 5.81,0 0,1 40.09,38.24Z" id="path_0"/>
    <path fill="#e8cc00" d="M5.17,79.43c0.27,0 0.54,0 0.82,-0.05h15.3c0.27,0 0.54,0 0.81,0.05a6.43,6.43 0,0 1,1.57 0.38,5.1 5.1,0 0,1 3.48,5.77 5.66,5.66 0,0 1,-4.25 3.91c-0.26,0.06 -0.53,0.09 -0.8,0.14l-0.81,0.05H6a6.71,6.71 0,0 1,-1.62 -0.19,6.91 6.91,0 0,1 -1.5,-0.56A5,5 0,0 1,0.12 83.48,5.83 5.83,0 0,1 5.17,79.43Z" id="path_1"/>
    <path fill="#e8cc00" d="M18.6,48.3c-0.27,0.06 -0.54,0.09 -0.8,0.14l-0.82,0.05H8.71a6.83,6.83 0,0 1,-1.62 -0.19,7.11 7.11,0 0,1 -1.5,-0.56 5,5 0,0 1,-2.75 -5.45,5.81 5.81,0 0,1 5.05,-4c0.27,0 0.55,0 0.82,-0.05H17c0.27,0 0.55,0 0.82,0.05a6.43,6.43 0,0 1,1.57 0.38,5.11 5.11,0 0,1 3.48,5.77A5.66,5.66 0,0 1,18.6 48.3Z" id="path_2"/>
    <path fill="#e8cc00" d="M48.51,10.11c-0.26,0.06 -0.53,0.09 -0.8,0.14l-0.82,0.05H38.62A6.69,6.69 0,0 1,37 10.11a6.91,6.91 0,0 1,-1.5 -0.56A5,5 0,0 1,32.76 4.1a5.8,5.8 0,0 1,5.05 -4c0.27,0 0.54,0 0.81,0h8.27c0.28,0 0.55,0 0.82,0.05a6.43,6.43 0,0 1,1.57 0.38A5.1,5.1 0,0 1,52.76 6.2,5.66 5.66,0 0,1 48.51,10.11Z" id="path_3"/>
    <path fill="#e8cc00" d="M320.23,0.07c-0.51,0 -1,-0.07 -1.51,-0.07H67c-0.28,0 -0.55,0 -0.82,0.05A5.81,5.81 0,0 0,61.13 4.1a5,5 0,0 0,2.75 5.45,6.91 6.91,0 0,0 1.5,0.56A6.71,6.71 0,0 0,67 10.3H82.09a7.52,7.52 0,0 1,0.82 0,6.91 6.91,0 0,1 1.57,0.37A5.11,5.11 0,0 1,88 16.49a5.62,5.62 0,0 1,-4.25 3.91c-0.2,0.05 -0.41,0.08 -0.61,0.12l-1,0.08H30.93c-0.27,0 -0.54,0 -0.81,0a5.84,5.84 0,0 0,-5.06 4.06,5 5,0 0,0 2.76,5.44 6,6 0,0 0,1.5 0.56,6.69 6.69,0 0,0 1.61,0.19h75.85c2.33,0 4.82,1.32 4.82,3.75s-2.16,3.55 -4.82,3.55H76.44c-0.27,0 -0.55,0 -0.82,0.05a5.81,5.81 0,0 0,-5.05 4,5 5,0 0,0 2.75,5.45 7.11,7.11 0,0 0,1.5 0.56,6.83 6.83,0 0,0 1.62,0.19H88.73a7.37,7.37 0,0 1,0.82 0,6.91 6.91,0 0,1 1.57,0.37 5.11,5.11 0,0 1,3.48 5.77,5.62 5.62,0 0,1 -4.25,3.91c-0.2,0 -0.4,0.08 -0.61,0.12l-1,0.08H6c-0.28,0 -0.55,0 -0.82,0a5.82,5.82 0,0 0,-5 4.06,5 5,0 0,0 2.75,5.44 6,6 0,0 0,1.5 0.56A6.71,6.71 0,0 0,6 69.08H74.72c0.28,0 0.55,0 0.82,0a6.92,6.92 0,0 1,1.57 0.38,5.1 5.1,0 0,1 3.48,5.77 5.64,5.64 0,0 1,-4.25 3.91,6 6,0 0,1 -0.61,0.11l-1,0.08H46.89c-0.27,0 -0.54,0 -0.81,0.05a5.82,5.82 0,0 0,-5 4,5 5,0 0,0 2.75,5.45 6.91,6.91 0,0 0,1.5 0.56,6.69 6.69,0 0,0 1.61,0.19H318.28a11.81,11.81 0,0 0,2 -0.16c6.72,-1.1 43,-8.79 43,-46.18C363.21,5.64 326.48,0.65 320.23,0.07Z" id="path_4"/>
</svg>
''';

class AllowedPaymentMethods {
  static const PAYMENT_CODE_COD = "cashondelivery";
  static const PAYMENT_CODE_BANK_TRANSFER = "banktransfer";
  static const PAYMENT_CODE_CHECK_MONEY_ORDER = "checkmo";
  static const PAYMENT_CODE_WALLET = "mpwalletsystem";
  static const PAYMENT_CODE_PAYFORT_FORT = "payfort_fort_cc";
  static const PAYMENT_CODE_HYPER_PAY_VISA = "HyperPay_Visa";
  static const PAYMENT_CODE_HYPER_PAY_MADA = "HyperPay_Mada";
  static const PAYMENT_CODE_HYPER_PAY_MASTER = "HyperPay_Master";
}

class BundleKeys {
  static const BUNDLE_VALUE_SELLER_TYPE = "supplier";
  static const BUNDLE_VALUE_BRAND_TYPE = "manufacturer";
  static const BUNDLE_VALUE_CATEGORY_TYPE = "category_id";
  static const BUNDLE_VALUE_SEARCH_TYPE = "search_term"; //"search"
  static const BUNDLE_VALUE_CUSTOM_CAROUSEL = "customCarousel";
}

enum ButtonSizes {
  SMALL,
  MEDIUM,
  LARGE
}

class AppImages {
  static const ic_app_logo_white = 'assets/images/ic_app_logo_white.png';
  static const ic_categories = 'assets/images/ic_categories.png';
  static const ic_brands = 'assets/images/ic_brands.png';
  static const ic_concepts = 'assets/images/ic_concepts.png';
  static const ic_offers = 'assets/images/ic_offers.png';

  static String imgPlaceholder(BuildContext context) {
    return isDarkMode(context) ? 'assets/images/ic_app_logo_white.png' : 'assets/images/ic_app_logo_grey.png';
  }
}

class CarouselTypes {
  static const product = 'product';
  static const image = 'image';
  static const category = 'category';
  static const banner = 'banner';
  static const brand = 'brand'; // done
  static const supplier = 'supplier';
  static const shop_by_categories = 'shopbycategories'; // done
  static const my_orders = 'myorders';
  static const all_categories = 'allcategories';
}

class CarouselItemHeight {
  static productHeight(BuildContext context) => 302.0;
  static imageHeight(BuildContext context) => (getScreenWidth(context) - 120) / 2;
  static const categoryHeight = 90.0;
  static bannerHeight(BuildContext context) => (getScreenWidth(context) / 2);
  static const brandHeight = 56.0;
  static const supplier = 'supplier';
  static const shop_by_categories = 56.0;
  static const myOrdersHeight = 120.0;
  static const all_categories = 'allcategories';
}

class CatalogItemHeight {
  static const catalogProductHeight = 311.0;
  static const catalogFeaturedProductHeight = 270.0;
  static const relatedProductHeight = 280.0;
  static productImageSliderHeight(BuildContext context) => getScreenHeightWithPercentage(context, 0.40);
}

class CategoriesItemHeight {
  static const subCategoryHeight = 140.0;
  static const subCategoryImageWidth = 100.0;
  static const brandHeight = 100.0;
  static const brandImageHeight = 60.0;
  static const bestSaleProductHeight = 298.0;
}


class LanguageCodes {
  static const en = 'en';
  static const ar = 'ar';
}

class ErrorCodes {
  static const er_phone = 'er_phone';
  static const er_email = 'er_email';
  static const er_email_format = 'er_email_format';
  static const er_company_name = 'er_company_name';
  static const er_restaurant_name = 'er_restaurant_name';
  static const er_contact_person = 'er_contact_person';
}

class NetworkMessages {
  static const networkError = 'Something went wrong!';
  static const connectionError = 'Connection to the server lost!';
}

class FontSize {
  // font sizes
  static const fontSizeExtraSmall = 12.0;
  static const fontSizeSmall = 14.0;
  static const fontSizeMedium = 16.0;
  static const fontSizeLarge = 18.0;
  static const fontSizeXLarge = 20.0;
  static const fontSizeXXLarge = 22.0;
  static const fontSizeXXXLarge = 24.0;
}

class Dimens {
  // screen spacing
  static const screenPadding = 24.0;
  static const screenPaddingMedium = 16.0;
  static const screenPaddingSmall = 8.0;

  // vertical/horizontal space
  static const spaceExtraSmall = 3.0;
  static const spaceSmall = 5.0;
  static const spaceMedium = 10.0;
  static const spaceLarge = 15.0;
  static const spaceXLarge = 25.0;
  static const spaceXXLarge = 35.0;
  static const spaceXXXLarge = 45.0;

  // Any widget radius
  static const radiusExtraSmall = 3.0;
  static const radiusSmall = 5.0;
  static const radiusMedium = 7.0;
  static const radiusLarge = 10.0;
  static const radiusXLarge = 15.0;
  static const radiusXXLarge = 25.0;
  static const radiusXXXLarge = 40.0;

  // Text field
  static const textFieldHeightExtraSmall = 50.0;
  static const textFieldHeightSmall = 60.0;
  static const textFieldHeight = 70.0;
  static const textFieldHeightLarge = 80.0;
  static const textFieldContentPadding = 16.0;

  // Title height
  static const titleHeight = 45.0;
  static const bottomSheetTitleHeight = 60.0;

  // button sizes
  static const btnContentPadding = 10.0;
  static const btnHeightSmall = 30.0;
  static const btnHeightMedium = 40.0;
  static const btnHeightGeneric = 45.0;
  static const btnHeightLarge = 50.0;

  // icon sizes
  static const iconSmall = 20.0;
  static const iconMedium = 30.0;
  static const iconLarge = 40.0;

  static getWidth50Percent(BuildContext context) =>
      {getScreenWidth(context) * 0.50};

  static getWidth70Percent(BuildContext context) =>
      {getScreenWidth(context) * 0.70};

  static getWidth30Percent(BuildContext context) =>
      {getScreenWidth(context) * 0.30};
}
