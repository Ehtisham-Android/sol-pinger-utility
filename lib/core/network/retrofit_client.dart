import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'retrofit_client.g.dart';

@RestApi()
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET('{url}')
  Future<dynamic> hitUrl(
      @Path("url") String url);

  // @GET(Urls.HOME_PAGE_API)
  // Future<HomePageDataModel> getHomePageData(
  //     @Path('storeCode') String storeCode,
  //     @Path('currency') String currency,
  //     @Path('mFactor') String factor,
  //     @Path('width') String width,
  //     @Path('isFromUrl') int isFromUrl);
  //
  // @GET(Urls.WEBSITES_API)
  // Future<WebsitesResponseModel> getWebsitesData();
  //
  // @GET(Urls.VALIDATE_PHONE_NUMBER)
  // Future<BaseModel> validatePhoneNumber(
  //     @Query("mobileNumber") String mobileNumber);
  //
  // @GET(Urls.VALIDATE_EMAIL_ADDRESS)
  // Future<BaseModel> verifyEmail(@Query("email") String email);
  //
  // @GET(Urls.SEND_OTP)
  // Future<OTPModel> sendOTP(
  //     @Query("storeId") String storeId,
  //     @Query("mobileNumber") String mobileNumber,
  //     @Query("email") String email,
  //     @Query("type") String type);
  //
  // @GET(Urls.VERIFY_OTP)
  // Future<LoginResponseModel> verifyOtp(@Query("storeId") String storeId,
  //     @Query("username") String username, @Query("otp") String otp);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_ORDER_LIST)
  // Future<OrdersResponseModel> getOrderList(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("currency") String currency,
  //     @Query("pageNumber") int pageNumber,
  //     @Query("forDashboard") String forDashboard,
  //     @Query("createdFrom") String createdFrom,
  //     @Query("createdTo") String createdTo);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_ORDER_DETAIL)
  // Future<OrderDetailsResponseModel> getOrderDetails(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("currency") String currency,
  //     @Query("incrementId") String incrementId);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_VIEW_INVOICE)
  // Future<OrderInvoiceViewResponseModel> getOrderInvoiceViewData(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("invoiceId") String invoiceId);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_VIEW_SHIPMENT)
  // Future<OrderShipmentViewResponseModel> getOrderShipmentViewData(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("shipmentId") String shipmentId);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_GET_ADDRESS_BOOK_DATA)
  // Future<AddressBookResponseModel> getAddressBookData(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("forDashboard") String forDashboard);

  // @GET('{url}')
  // Future<CatalogFeaturedProductsV1ResponseModel> getCatalogFeaturedProductsData(
  //     @Path("url") String url);
  //
  // @GET('{url}')
  // Future<ProductDetailsResponseModel> getProductDetails(
  //     @Path("url") String url);
  //
  // @GET(Urls.CATEGORY_DATA_V1)
  // Future<CategoryResponseModel> getCategoryData(
  //     @Path("storeCode") String storeCode,
  //     @Path('currency') String currency,
  //     @Path('mFactor') String factor,
  //     @Path('width') String width,
  //     @Path('categoryId') String categoryId);
  //
  // @POST(Urls.CREATE_ACCOUNT)
  // @MultiPart()
  // Future<CreateAccountResponseModel> createAccount(
  //     @Part(name: "websiteId") String websiteId,
  //     @Part(name: "storeId") String storeId,
  //     @Part(name: "quoteId") String quoteId,
  //     @Part(name: "width") String width,
  //     @Part(name: "mFactor") String mFactor,
  //     @Part(name: "prefix") String prefix,
  //     @Part(name: "firstName") String firstName,
  //     @Part(name: "middleName") String middleName,
  //     @Part(name: "lastName") String lastName,
  //     @Part(name: "suffix") String suffix,
  //     @Part(name: "dob") String dob,
  //     @Part(name: "gender") String gender,
  //     @Part(name: "email") String email,
  //     @Part(name: "password") String password,
  //     @Part(name: "pictureURL") String pictureURL,
  //     @Part(name: "isSocial") bool isSocial,
  //     @Part(name: "mobile") String mobile,
  //     @Part(name: "token") String token,
  //     @Part(name: "becomeSeller") String becomeSeller,
  //     @Part(name: "os") String os,
  //     @Part(name: "orderId") String orderId,
  //     @Part(name: "cr_supplier") String crSupplier,
  //     @Part(name: "shopUrl") String shopURL,
  //     @Part(name: "vat_number") String vatNumber,
  //     @Part(name: "taxvat") String taxVat,
  //     @Part(name: "cr_number") String crNumber,
  //     @Part(name: "company") String company,
  //     @Part(name: "wkv_cr_supplier") String wkvCrSupplier,
  //     @Part(name: "wkv_vat_number") String wkvVatNumber,
  //     {@Part(name: "cr_attachment") File? crBuyerFile,
  //     @Part(name: "vat_certificate") File? vatBuyerFile,
  //     @Part(name: "wkv_cr_attachment_supplier") File? crSupplierFile,
  //     @Part(name: "wkv_vat_attach_supplier") File? vatSupplierFile});
  //
  // @POST(Urls.MOBIKUL_CHECKOUT_ADD_TO_CART)
  // @MultiPart()
  // Future<AddToCartResponseModel> addToCart(
  //     @Part(name: "storeId") String storeId,
  //     @Part(name: "customerToken") String customerToken,
  //     @Part(name: "quoteId") String quoteId,
  //     @Part(name: "productId") String productId,
  //     @Part(name: "qty") String qty,
  //     @Part(name: "params") params,
  //     @Part(name: "relatedProducts") String relatedProducts,
  //     @Part(name: "crossSaleIds") String? crossSaleIds);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_WISH_LIST)
  // Future<WishlistResponseModel> getWishList(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("currency") String currency,
  //     @Query("pageNumber") int pageNumber);
  //
  // @POST(Urls.MOBIKUL_CATALOG_ADD_TO_WISH_LIST)
  // @MultiPart()
  // Future<AddToWishlistResponseModel> addToWishList(
  //     @Part(name: "storeId") String storeId,
  //     @Part(name: "customerToken") String customerToken,
  //     @Part(name: "productId") String productId,
  //     @Part(name: "params") String params,
  //     @Part(name: "qty") String qty);
  //
  // @DELETE(Urls.MOBIKUL_CUSTOMER_REMOVE_FROM_WISH_LIST)
  // Future<BaseModel> removeFromWishList(
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("itemId") String itemId);
  //
  // @GET(Urls.MOBIKUL_CHECKOUT_CART_DETAILS)
  // Future<CartDetailsResponseModel> getCartDetails(
  //     @Query("eTag") String eTag,
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("quoteId") String quoteId,
  //     @Query("width") String width,
  //     @Query("currency") String currency);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_REMOVE_CART_ITEM)
  // Future<BaseModel> removeFromCart(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("itemId") String itemId);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_APPLY_COUPON)
  // Future<BaseModel> applyOrRemoveCoupon(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("couponCode") String couponCode,
  //     @Field("removeCoupon") int removeCoupon); // if (removeCoupon) 1 else 0
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_EMPTY_CART)
  // Future<BaseModel> clearCart(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_UPDATE_CART)
  // Future<BaseModel> updateCart(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("itemIds") String itemIds,
  //     @Field("itemQtys") String itemQtys);
  //
  // @GET(Urls.MOBIKUL_CHECKOUT_ADDRESS_INFO)
  // Future<CheckoutAddressInfoResponseModel> getCheckoutAddresses(
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("quoteId") int quoteId);
  //
  // @DELETE(Urls.MOBIKUL_CUSTOMER_DELETE_ADDRESS)
  // Future<BaseModel> checkoutAddressDelete(
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("addressId") String addressId);
  //
  // @GET(Urls.MOBIKUL_CHECKOUT_SHIPPING_METHODS)
  // Future<ShippingMethodsModel> getShippingMethods(
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("quoteId") int quoteId,
  //     @Query("currency") String currency,
  //     @Query("method") String method,
  //     @Query("shippingData") Map<String, dynamic> shippingData);
  //
  // @GET(Urls.MOBIKUL_PAYMENT_METHODS)
  // Future<ReviewsAndPaymentsResponseModel> getPaymentMethods(
  //     @Query("storeId") String storeId,
  //     @Query("customerToken") String customerToken,
  //     @Query("quoteId") int quoteId);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_REVIEWS_AND_PAYMENTS)
  // Future<ReviewsAndPaymentsResponseModel> getReviewsAndPaymentsData(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("currency") String currency,
  //     @Field("width") int width,
  //     @Field("method") String method,
  //     @Field("shippingMethod") String? shippingMethod);
  //
  // @GET(Urls.MOBIKUL_CUSTOMER_WALLET_PAYMENT_METHODS)
  // Future<WalletPaymentMethodsResponseModel> getWalletPaymentMethods(
  //     @Query("storeId") String wallet);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_PLACE_ORDER)
  // Future<SaveOrderResponseModel> placeOrder(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("paymentMethod") String paymentMethod,
  //     @Field("billingData") Map<String, dynamic> paymentData,
  //     @Field("method") String method,
  //     @Field("token") String? token,
  //     @Field("purchasePoint") String? purchasePoint,
  //     @Field("os") String os);
  //
  // @FormUrlEncoded()
  // @POST(Urls.MOBIKUL_CHECKOUT_WALLET_PLACE_ORDER)
  // Future<SaveOrderResponseModel> walletPlaceOrder(
  //     @Field("storeId") String storeId,
  //     @Field("customerToken") String customerToken,
  //     @Field("quoteId") int quoteId,
  //     @Field("paymentMethod") String paymentMethod,
  //     @Field("billingData") Map<String, dynamic> paymentData,
  //     @Field("method") String method,
  //     @Field("token") String? token,
  //     @Field("purchasePoint") String? purchasePoint,
  //     @Field("os") String os,
  //     @Field("price") String price);
  //
  // @GET(Urls.SET_OR_RESET_WALLET)
  // Future<WalletStatusDataResponseModel> setResetWalletInCheckout(
  //     @Query("wallet") String wallet, @Query("grandtotal") double grandTotal);
}
