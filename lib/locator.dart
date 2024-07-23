import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sol_pinger_utility/domain/use_cases/get_url_list.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';

import 'core/constants/app_shared_prefs.dart';
import 'core/database/db_helper.dart';
import 'data/data_sources/contracts/home_page_data_source.dart';
import 'data/data_sources/local/home_page_local_data_source_impl.dart';
import 'data/repositories/home_page_repository_impl.dart';
import 'domain/repositories/home_page_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Shared Preferences
  final appSharedPrefs = await AppSharedPref.getSharedPrefs();
  locator.registerSingleton(appSharedPrefs);

  // DB Helper
  final dbHelper = DatabaseHelper.getInstance();
  locator.registerSingleton(dbHelper);

  // Retrofit //////////////////////////////////////////////////////////////////
  // final dio = buildDioClient(Environment.BASE_URL);
  // locator.registerLazySingleton<RetrofitClient>(() => RetrofitClient(dio));

  // permission ////////////////////////////////////////////////////////////////
  // locator.registerFactory(() => PermissionsHelper());

  // bloc //////////////////////////////////////////////////////////////////////
  locator.registerFactory(() => HomePageBloc(locator()));
  // locator.registerFactory(() => WebsitesBloc(locator()));
  // locator.registerFactory(() => SendOtpBloc(locator()));
  // locator.registerFactory(() => LoginBloc(locator()));
  // locator.registerFactory(() => VerifyPhoneNumberBloc(locator()));
  // locator.registerFactory(() => AppPermissionsBloc(locator()));
  // locator.registerFactory(() => CreateAccountBloc(locator()));
  // locator.registerFactory(() => VerifyEmailBloc(locator()));
  // locator.registerFactory(() => OrdersBloc(locator()));
  // locator.registerFactory(() => CatalogBloc(locator()));
  // locator.registerFactory(() => CatalogFeaturedBloc(locator()));
  // locator.registerFactory(() => PostActionsBloc(locator()));
  // locator.registerFactory(() => OrderDetailsBloc(locator()));
  // locator.registerFactory(() => InvoiceViewBloc(locator()));
  // locator.registerFactory(() => ShipmentViewBloc(locator()));
  // locator.registerFactory(() => ProductDetailsBloc(locator()));
  // locator
  //     .registerFactory(() => HomeScreenBloc(locator(), locator(), locator()));
  // locator.registerFactory(() => AddToCartProductBloc(locator()));
  // locator.registerFactory(() => CategoryDataBloc(locator()));
  // locator.registerFactory(() => CartDetailsBloc(locator(), locator()));
  // locator.registerFactory(() => RemoveCartItemBloc(locator()));
  // locator.registerFactory(() => ClearCartBloc(locator()));
  // locator.registerFactory(() => ApplyCouponBloc(locator()));
  // locator.registerFactory(() => CartItemQtyBloc(locator()));
  // locator.registerFactory(() => CheckoutAddressesBloc(locator()));
  // locator.registerFactory(() => AddressBookBloc(locator()));
  // locator.registerFactory(() => ReviewsAndPaymentsBloc(locator()));
  // locator.registerFactory(() => WalletStatusBloc(locator()));
  // locator.registerFactory(() => PlaceOrderBloc(locator()));
  //
  // // use case //////////////////////////////////////////////////////////////////
  locator.registerLazySingleton(
      () => GetUrlListUseCase(homePageRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetWebsitesUseCase(websitesRepository: locator()));
  // locator.registerLazySingleton(
  //     () => SendOtpUseCase(sendOtpRepository: locator()));
  // locator.registerLazySingleton(() => LoginUseCase(loginRepository: locator()));
  // locator.registerLazySingleton(
  //     () => VerifyPhoneNumberUseCase(verifyPhoneNumberRepository: locator()));
  // locator.registerLazySingleton(
  //     () => CreateAccountUseCase(createAccountRepository: locator()));
  // locator.registerLazySingleton(
  //     () => VerifyEmailUseCase(verifyEmailRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetOrdersListUseCase(ordersListRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetCatalogProductsUseCase(catalogProductsRepository: locator()));
  // locator.registerLazySingleton(() => GetCatalogFeaturedProductsUseCase(
  //     catalogFeaturedProductsRepository: locator()));
  // locator.registerLazySingleton(
  //     () => PostActionsUseCase(postActionsRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetOrderDetailsUseCase(orderDetailsRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetOrderInvoiceViewUseCase(orderInvoiceViewRepository: locator()));
  // locator.registerLazySingleton(() =>
  //     GetOrderShipmentViewUseCase(orderShipmentViewRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetProductDetailsUseCase(productDetailsRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetCategoryDataUseCase(categoryDataRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetWishlistUseCase(wishlistRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetCartDetailsUseCase(cartDetailsRepository: locator()));
  // locator.registerLazySingleton(() =>
  //     GetCheckoutAddressesUseCase(checkoutAddressesRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetAddressBookUseCase(addressBookRepository: locator()));
  // locator.registerLazySingleton(() =>
  //     GetReviewsAndPaymentsUseCase(reviewsAndPaymentsRepository: locator()));
  // locator.registerLazySingleton(
  //     () => GetWalletStatusUseCase(walletStatusRepository: locator()));
  // locator.registerLazySingleton(
  //     () => PlaceOrderUseCase(placeOrderRepository: locator()));
  //
  // // repository ////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<HomePageRepository>(
    () => HomePageRepositoryImpl(homePageLocalDataSource: locator()),
  );
  //
  // locator.registerLazySingleton<WebsitesRepository>(
  //   () => WebsitesRepositoryImpl(websitesRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<SendOtpRepository>(
  //   () => SendOtpRepositoryImpl(sendOtpDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<LoginRepository>(
  //   () => LoginRepositoryImpl(loginDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<VerifyPhoneNumberRepository>(
  //   () =>
  //       VerifyPhoneNumberRepositoryImpl(verifyPhoneNumberDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CreateAccountRepository>(
  //   () => CreateAccountRepositoryImpl(createAccountDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<VerifyEmailRepository>(
  //   () => VerifyEmailRepositoryImpl(verifyEmailDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<OrdersListRepository>(
  //   () => OrdersListRepositoryImpl(ordersListRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CatalogProductsRepository>(
  //   () => CatalogProductsRepositoryImpl(
  //       catalogProductsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CatalogFeaturedProductsRepository>(
  //   () => CatalogFeaturedProductsRepositoryImpl(
  //       catalogFeaturedProductsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<PostActionsRepository>(
  //   () => PostActionsRepositoryImpl(postActionsDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderDetailsRepository>(
  //   () => OrderDetailsRepositoryImpl(orderDetailsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderInvoiceViewRepository>(
  //   () => OrderInvoiceViewRepositoryImpl(
  //       orderInvoiceViewRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderShipmentViewRepository>(
  //   () => OrderShipmentViewRepositoryImpl(
  //       orderShipmentViewRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<ProductDetailsRepository>(
  //   () =>
  //       ProductDetailsRepositoryImpl(productDetailsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CategoryDataRepository>(
  //   () => CategoryDataRepositoryImpl(categoryDataRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<WishlistRepository>(
  //   () => WishlistRepositoryImpl(wishlistRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CartDetailsRepository>(
  //   () => CartDetailsRepositoryImpl(cartDetailsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<CheckoutAddressesRepository>(
  //   () => CheckoutAddressesRepositoryImpl(
  //       checkoutAddressesRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<AddressBookRepository>(
  //   () => AddressBookRepositoryImpl(addressBookRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<ReviewsAndPaymentsRepository>(
  //   () => ReviewsAndPaymentsRepositoryImpl(
  //       reviewsAndPaymentsRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<WalletStatusRepository>(
  //   () => WalletStatusRepositoryImpl(walletStatusRemoteDataSource: locator()),
  // );
  //
  // locator.registerLazySingleton<PlaceOrderRepository>(
  //   () => PlaceOrderRepositoryImpl(placeOrderRemoteDataSource: locator()),
  // );
  //
  // // data source ///////////////////////////////////////////////////////////////
  locator.registerLazySingleton<HomePageDataSource>(
    () => HomePageLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  // locator.registerLazySingleton<WebsitesRemoteDataSource>(
  //   () => WebsitesRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<SendOtpDataSource>(
  //   () => SendOtpDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<LoginDataSource>(
  //   () => LoginDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<VerifyPhoneNumberDataSource>(
  //   () => VerifyPhoneNumberDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CreateAccountDataSource>(
  //   () => CreateAccountDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<VerifyEmailDataSource>(
  //   () => VerifyEmailDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<OrdersListRemoteDataSource>(
  //   () => OrdersListRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CatalogProductsRemoteDataSource>(
  //   () => CatalogProductsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CatalogFeaturedProductsRemoteDataSource>(
  //   () =>
  //       CatalogFeaturedProductsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<PostActionsDataSource>(
  //   () => PostActionsDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderDetailsRemoteDataSource>(
  //   () => OrderDetailsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderInvoiceViewRemoteDataSource>(
  //   () => OrderInvoiceViewRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<OrderShipmentViewRemoteDataSource>(
  //   () => OrderShipmentViewRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<ProductDetailsRemoteDataSource>(
  //   () => ProductDetailsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CategoryDataRemoteDataSource>(
  //   () => CategoryDataRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<WishlistRemoteDataSource>(
  //   () => WishlistRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CartDetailsRemoteDataSource>(
  //   () => CartDetailsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<CheckoutAddressesRemoteDataSource>(
  //   () => CheckoutAddressesRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<AddressBookRemoteDataSource>(
  //   () => AddressBookRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<ReviewsAndPaymentsRemoteDataSource>(
  //   () => ReviewsAndPaymentsRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<WalletStatusRemoteDataSource>(
  //   () => WalletStatusRemoteDataSourceImpl(retrofitClient: locator()),
  // );
  //
  // locator.registerLazySingleton<PlaceOrderRemoteDataSource>(
  //   () => PlaceOrderRemoteDataSourceImpl(retrofitClient: locator()),
  // );

  // http client ///////////////////////////////////////////////////////////////
  locator.registerLazySingleton(() => http.Client());
}
