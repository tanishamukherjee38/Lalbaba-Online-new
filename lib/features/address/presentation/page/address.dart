// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

// import '../../../../app/theme/app_colors.dart';
// import '../../../../app/theme/app_text_styles.dart';
// import '../../../../core/helpers/snackbar_helper.dart';
// import '../../../../core/widgets/app_app_bar.dart';
// import '../../../account/presentation/widgets/app_string.dart';
// import '../widgets/address_dropdown_field.dart';
// import '../widgets/address_header.dart';
// import '../widgets/address_text_field.dart';

// class AddressPage extends StatefulWidget {
//   const AddressPage({super.key});

//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
//   // ============================================================
//   // FORM
//   // ============================================================

//   final _formKey = GlobalKey<FormState>();

//   // ============================================================
//   // CONTROLLERS
//   // ============================================================

//   final nameController = TextEditingController(text: 'Guest');
//   final phoneController = TextEditingController();
//   final addressController = TextEditingController();
//   final landmarkController = TextEditingController();
//   final pinController = TextEditingController();

//   // ============================================================
//   // LOCATION
//   // ============================================================

//   String? country;
//   String? state;
//   String? city;
//   String? village;

//   String addressType = 'Home';

//   final countries = <String>['India', 'Bangladesh', 'Nepal'];

//   final states = <String>[];
//   final cities = <String>[];
//   final villages = <String>[];

//   // ============================================================
//   // LOADING
//   // ============================================================

//   bool isSaving = false;
//   bool isGettingLocation = false;

//   // ============================================================
//   // GEOCODING
//   // ============================================================

//   final Geocoding _geocoding = Geocoding();

//   // ============================================================
//   // DISPOSE
//   // ============================================================

//   @override
//   void dispose() {
//     nameController.dispose();
//     phoneController.dispose();
//     addressController.dispose();
//     landmarkController.dispose();
//     pinController.dispose();

//     super.dispose();
//   }

//   // ============================================================
//   // HELPER
//   // ============================================================

//   void _addIfMissing(List<String> list, String? value) {
//     final trimmedValue = value?.trim();

//     if (trimmedValue == null || trimmedValue.isEmpty) {
//       return;
//     }

//     if (!list.any(
//       (item) => item.trim().toLowerCase() == trimmedValue.toLowerCase(),
//     )) {
//       list.add(trimmedValue);
//     }
//   }

//   // ============================================================
//   // LOAD STATES
//   // ============================================================

//   void loadStates(String? selectedCountry, {String? detectedState}) {
//     if (selectedCountry == null) {
//       return;
//     }

//     final newStates = <String>[];

//     switch (selectedCountry) {
//       case 'India':
//         newStates.addAll(['West Bengal', 'Bihar', 'Jharkhand', 'Odisha']);
//         break;

//       case 'Bangladesh':
//         newStates.addAll(['Dhaka', 'Chattogram', 'Rajshahi', 'Khulna']);
//         break;

//       case 'Nepal':
//         newStates.addAll(['Bagmati', 'Gandaki', 'Lumbini']);
//         break;
//     }

//     // Add GPS detected state if it is not
//     // already available in the list.
//     if (detectedState != null &&
//         detectedState.trim().isNotEmpty &&
//         !newStates.any(
//           (item) =>
//               item.trim().toLowerCase() == detectedState.trim().toLowerCase(),
//         )) {
//       newStates.add(detectedState.trim());
//     }

//     setState(() {
//       states
//         ..clear()
//         ..addAll(newStates);

//       cities.clear();
//       villages.clear();
//     });
//   }

//   // ============================================================
//   // LOAD CITIES
//   // ============================================================

//   void loadCities(String? selectedState, {String? detectedCity}) {
//     if (selectedState == null) {
//       return;
//     }

//     const citiesByState = <String, List<String>>{
//       'West Bengal': ['Kolkata', 'Siliguri', 'Durgapur'],
//       'Bihar': ['Patna', 'Gaya', 'Muzaffarpur'],
//       'Jharkhand': ['Ranchi', 'Jamshedpur', 'Dhanbad'],
//       'Odisha': ['Bhubaneswar', 'Cuttack', 'Rourkela'],
//       'Dhaka': ['Dhaka', 'Gazipur', 'Narayanganj'],
//       'Chattogram': ['Chattogram', "Cox's Bazar", 'Cumilla'],
//       'Rajshahi': ['Rajshahi', 'Pabna', 'Natore'],
//       'Khulna': ['Khulna', 'Jessore', 'Satkhira'],
//       'Bagmati': ['Kathmandu', 'Lalitpur', 'Bhaktapur'],
//       'Gandaki': ['Pokhara', 'Gorkha', 'Baglung'],
//       'Lumbini': ['Butwal', 'Bhairahawa', 'Nepalgunj'],
//     };

//     final newCities = <String>[...(citiesByState[selectedState] ?? const [])];

//     // Add GPS detected city if it is not
//     // already available in the list.
//     if (detectedCity != null &&
//         detectedCity.trim().isNotEmpty &&
//         !newCities.any(
//           (item) =>
//               item.trim().toLowerCase() == detectedCity.trim().toLowerCase(),
//         )) {
//       newCities.add(detectedCity.trim());
//     }

//     setState(() {
//       cities
//         ..clear()
//         ..addAll(newCities);

//       villages.clear();
//     });
//   }

//   // ============================================================
//   // LOAD VILLAGES / AREAS
//   // ============================================================

//   void loadVillages(String? selectedCity, {String? detectedVillage}) {
//     if (selectedCity == null) {
//       return;
//     }

//     const villagesByCity = <String, List<String>>{
//       'Kolkata': ['Salt Lake', 'Behala', 'Jadavpur'],
//       'Siliguri': ['Matigara', 'Bagdogra', 'Sevoke'],
//       'Durgapur': ['Bidhannagar', 'Benachity', 'City Centre'],
//       'Patna': ['Kankarbagh', 'Rajendra Nagar', 'Danapur'],
//       'Gaya': ['Bodh Gaya', 'Civil Lines', 'Manpur'],
//       'Ranchi': ['Doranda', 'Harmu', 'Kanke'],
//       'Bhubaneswar': ['Patia', 'Khandagiri', 'Sahid Nagar'],
//       'Dhaka': ['Mirpur', 'Uttara', 'Dhanmondi'],
//       'Chattogram': ['Pahartali', 'Agrabad', 'Halishahar'],
//       'Rajshahi': ['Boalia', 'Motihar', 'Shah Makhdum'],
//       'Khulna': ['Sonadanga', 'Khalishpur', 'Daulatpur'],
//       'Kathmandu': ['Thamel', 'Baneshwor', 'Balaju'],
//       'Lalitpur': ['Patan', 'Jawalakhel', 'Pulchowk'],
//       'Bhaktapur': ['Suryabinayak', 'Thimi', 'Duwakot'],
//       'Pokhara': ['Lakeside', 'Hemja', 'Simalchaur'],
//       'Butwal': ['Golpark', 'Traffic Chowk', 'Kalikanagar'],
//     };

//     final newVillages = <String>[...(villagesByCity[selectedCity] ?? const [])];

//     // IMPORTANT:
//     // GPS may return areas such as:
//     // Beleghata, Park Circus, Tangra, etc.
//     //
//     // Add detected area dynamically.
//     if (detectedVillage != null &&
//         detectedVillage.trim().isNotEmpty &&
//         !newVillages.any(
//           (item) =>
//               item.trim().toLowerCase() == detectedVillage.trim().toLowerCase(),
//         )) {
//       newVillages.add(detectedVillage.trim());
//     }

//     setState(() {
//       villages
//         ..clear()
//         ..addAll(newVillages);
//     });
//   }

//   // ============================================================
//   // CURRENT LOCATION
//   // ============================================================

//   Future<void> getCurrentLocation() async {
//     if (isGettingLocation) {
//       return;
//     }

//     setState(() {
//       isGettingLocation = true;
//     });

//     try {
//       // ----------------------------------------------------------
//       // CHECK LOCATION SERVICE
//       // ----------------------------------------------------------

//       final serviceEnabled = await Geolocator.isLocationServiceEnabled();

//       if (!serviceEnabled) {
//         FeedbackHelper.showError(context, AppStrings.pleaseEnableLocation);
//         return;
//       }

//       // ----------------------------------------------------------
//       // CHECK PERMISSION
//       // ----------------------------------------------------------

//       LocationPermission permission = await Geolocator.checkPermission();

//       if (permission == LocationPermission.denied) {
//         permission = await Geolocator.requestPermission();
//       }

//       if (permission == LocationPermission.denied) {
//         FeedbackHelper.showError(context, AppStrings.locationPermissionDenied);
//         return;
//       }

//       if (permission == LocationPermission.deniedForever) {
//         FeedbackHelper.showError(
//           context,
//           AppStrings.locationPermissionDeniedForever,
//         );
//         return;
//       }

//       // ----------------------------------------------------------
//       // GET GPS POSITION
//       // ----------------------------------------------------------

//       final position = await Geolocator.getCurrentPosition(
//         locationSettings: const LocationSettings(
//           accuracy: LocationAccuracy.high,
//         ),
//       );

//       // ----------------------------------------------------------
//       // REVERSE GEOCODING
//       // ----------------------------------------------------------

//       final placemarks = await _geocoding.placemarkFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );

//       if (placemarks.isEmpty) {
//         throw Exception('Address not found');
//       }

//       final place = placemarks.first;

//       if (!mounted) {
//         return;
//       }

//       // ----------------------------------------------------------
//       // BUILD ADDRESS
//       // ----------------------------------------------------------

//       final addressParts =
//           [place.name, place.street, place.thoroughfare, place.subThoroughfare]
//               .where((value) => value != null && value.trim().isNotEmpty)
//               .map((value) => value!.trim())
//               .toList();

//       // ----------------------------------------------------------
//       // GET LOCATION VALUES
//       // ----------------------------------------------------------

//       final detectedCountry = place.country?.trim();

//       final detectedState = place.administrativeArea?.trim();

//       final detectedCity = place.locality?.trim();

//       final detectedVillage = place.subLocality?.trim();

//       // ----------------------------------------------------------
//       // UPDATE COUNTRY
//       // ----------------------------------------------------------

//       String? selectedCountry;

//       if (detectedCountry != null && detectedCountry.isNotEmpty) {
//         _addIfMissing(countries, detectedCountry);

//         selectedCountry = detectedCountry;
//       }

//       // ----------------------------------------------------------
//       // LOAD STATE LIST
//       // ----------------------------------------------------------

//       final newStates = <String>[];

//       if (selectedCountry != null) {
//         switch (selectedCountry) {
//           case 'India':
//             newStates.addAll(['West Bengal', 'Bihar', 'Jharkhand', 'Odisha']);
//             break;

//           case 'Bangladesh':
//             newStates.addAll(['Dhaka', 'Chattogram', 'Rajshahi', 'Khulna']);
//             break;

//           case 'Nepal':
//             newStates.addAll(['Bagmati', 'Gandaki', 'Lumbini']);
//             break;
//         }
//       }

//       _addIfMissing(newStates, detectedState);

//       // ----------------------------------------------------------
//       // LOAD CITY LIST
//       // ----------------------------------------------------------

//       final newCities = <String>[];

//       const citiesByState = <String, List<String>>{
//         'West Bengal': ['Kolkata', 'Siliguri', 'Durgapur'],
//         'Bihar': ['Patna', 'Gaya', 'Muzaffarpur'],
//         'Jharkhand': ['Ranchi', 'Jamshedpur', 'Dhanbad'],
//         'Odisha': ['Bhubaneswar', 'Cuttack', 'Rourkela'],
//         'Dhaka': ['Dhaka', 'Gazipur', 'Narayanganj'],
//         'Chattogram': ['Chattogram', "Cox's Bazar", 'Cumilla'],
//         'Rajshahi': ['Rajshahi', 'Pabna', 'Natore'],
//         'Khulna': ['Khulna', 'Jessore', 'Satkhira'],
//         'Bagmati': ['Kathmandu', 'Lalitpur', 'Bhaktapur'],
//         'Gandaki': ['Pokhara', 'Gorkha', 'Baglung'],
//         'Lumbini': ['Butwal', 'Bhairahawa', 'Nepalgunj'],
//       };

//       if (detectedState != null) {
//         newCities.addAll(citiesByState[detectedState] ?? const []);
//       }

//       _addIfMissing(newCities, detectedCity);

//       // ----------------------------------------------------------
//       // LOAD VILLAGE / AREA LIST
//       // ----------------------------------------------------------

//       final newVillages = <String>[];

//       const villagesByCity = <String, List<String>>{
//         'Kolkata': ['Salt Lake', 'Behala', 'Jadavpur'],
//         'Siliguri': ['Matigara', 'Bagdogra', 'Sevoke'],
//         'Durgapur': ['Bidhannagar', 'Benachity', 'City Centre'],
//         'Patna': ['Kankarbagh', 'Rajendra Nagar', 'Danapur'],
//         'Gaya': ['Bodh Gaya', 'Civil Lines', 'Manpur'],
//         'Ranchi': ['Doranda', 'Harmu', 'Kanke'],
//         'Bhubaneswar': ['Patia', 'Khandagiri', 'Sahid Nagar'],
//         'Dhaka': ['Mirpur', 'Uttara', 'Dhanmondi'],
//         'Chattogram': ['Pahartali', 'Agrabad', 'Halishahar'],
//         'Rajshahi': ['Boalia', 'Motihar', 'Shah Makhdum'],
//         'Khulna': ['Sonadanga', 'Khalishpur', 'Daulatpur'],
//         'Kathmandu': ['Thamel', 'Baneshwor', 'Balaju'],
//         'Lalitpur': ['Patan', 'Jawalakhel', 'Pulchowk'],
//         'Bhaktapur': ['Suryabinayak', 'Thimi', 'Duwakot'],
//         'Pokhara': ['Lakeside', 'Hemja', 'Simalchaur'],
//         'Butwal': ['Golpark', 'Traffic Chowk', 'Kalikanagar'],
//       };

//       if (detectedCity != null) {
//         newVillages.addAll(villagesByCity[detectedCity] ?? const []);
//       }

//       // This is the important part.
//       // Example:
//       // GPS -> Beleghata
//       // villages -> [..., Beleghata]
//       _addIfMissing(newVillages, detectedVillage);

//       // ----------------------------------------------------------
//       // UPDATE EVERYTHING AT ONCE
//       // ----------------------------------------------------------

//       setState(() {
//         country = selectedCountry;
//         state = detectedState;
//         city = detectedCity;
//         village = detectedVillage;

//         states
//           ..clear()
//           ..addAll(newStates);

//         cities
//           ..clear()
//           ..addAll(newCities);

//         villages
//           ..clear()
//           ..addAll(newVillages);

//         pinController.text = place.postalCode?.trim() ?? '';

//         addressController.text = addressParts.join(', ');
//       });

//       // ----------------------------------------------------------
//       // SUCCESS
//       // ----------------------------------------------------------

//       FeedbackHelper.showSuccess(context, AppStrings.currentLocationDetected);
//     } catch (e) {
//       if (!mounted) {
//         return;
//       }

//       FeedbackHelper.showError(context, AppStrings.unableToDetectLocation);
//     } finally {
//       if (mounted) {
//         setState(() {
//           isGettingLocation = false;
//         });
//       }
//     }
//   }

//   // ============================================================
//   // SAVE ADDRESS
//   // ============================================================

//   Future<void> saveAddress() async {
//     // ----------------------------------------------------------
//     // FORM VALIDATION
//     // ----------------------------------------------------------

//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     // ----------------------------------------------------------
//     // LOCATION VALIDATION
//     // ----------------------------------------------------------

//     if (country == null || country!.trim().isEmpty) {
//       FeedbackHelper.showError(context, AppStrings.selectCountryFirst);
//       return;
//     }

//     if (state == null || state!.trim().isEmpty) {
//       FeedbackHelper.showError(context, AppStrings.selectStateFirst);
//       return;
//     }

//     if (city == null || city!.trim().isEmpty) {
//       FeedbackHelper.showError(context, AppStrings.selectCityFirst);
//       return;
//     }

//     if (village == null || village!.trim().isEmpty) {
//       FeedbackHelper.showError(context, AppStrings.selectVillageOrArea);
//       return;
//     }

//     // ----------------------------------------------------------
//     // PREVENT DOUBLE SAVE
//     // ----------------------------------------------------------

//     if (isSaving) {
//       return;
//     }

//     setState(() {
//       isSaving = true;
//     });

//     try {
//       // ========================================================
//       // TODO:
//       // API CALL WILL GO HERE
//       // ========================================================

//       await Future.delayed(const Duration(seconds: 1));

//       if (!mounted) {
//         return;
//       }

//       FeedbackHelper.showSuccess(context, 'Address saved successfully');

//       Navigator.pop(context, true);
//     } catch (e) {
//       if (!mounted) {
//         return;
//       }

//       FeedbackHelper.showError(context, 'Failed to save address');
//     } finally {
//       if (mounted) {
//         setState(() {
//           isSaving = false;
//         });
//       }
//     }
//   }

//   // ============================================================
//   // BUILD
//   // ============================================================

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,

//       // ========================================================
//       // APP BAR
//       // ========================================================
//       appBar: AppAppBar(
//         automaticallyImplyLeading: true,
//         title: AppStrings.address,
//       ),

//       // ========================================================
//       // BODY
//       // ========================================================
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // ==================================================
//                     // CURRENT LOCATION
//                     // ==================================================
//                     _CurrentLocationButton(
//                       onPressed: getCurrentLocation,
//                       isLoading: isGettingLocation,
//                     ),

//                     SizedBox(height: 26.h),

//                     // ==================================================
//                     // CONTACT INFORMATION
//                     // ==================================================
//                     _sectionTitle(
//                       icon: Icons.person_outline_rounded,
//                       title: AppStrings.contactInformation,
//                     ),

//                     SizedBox(height: 14.h),

//                     AppTextField(
//                       controller: nameController,
//                       label: AppStrings.fullName,
//                       hint: AppStrings.enterFullName,
//                       icon: Icons.person_outline_rounded,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return AppStrings.enterFullName;
//                         }

//                         if (value.trim().length < 2) {
//                           return AppStrings.enterFullName;
//                         }

//                         return null;
//                       },
//                     ),

//                     SizedBox(height: 12.h),

//                     AppTextField(
//                       controller: phoneController,
//                       label: AppStrings.phoneNumber,
//                       hint: AppStrings.enterPhoneNumber,
//                       icon: Icons.phone_outlined,
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         final phone = value?.trim() ?? '';

//                         if (phone.isEmpty) {
//                           return AppStrings.enterPhoneNumber;
//                         }

//                         if (phone.length < 10) {
//                           return AppStrings.enterPhoneNumber;
//                         }

//                         return null;
//                       },
//                     ),

//                     SizedBox(height: 26.h),

//                     // ==================================================
//                     // LOCATION
//                     // ==================================================
//                     _sectionTitle(
//                       icon: Icons.map_outlined,
//                       title: AppStrings.location,
//                     ),

//                     SizedBox(height: 14.h),

//                     // COUNTRY
//                     AppDropdown(
//                       label: AppStrings.country,
//                       hint: AppStrings.selectCountry,
//                       icon: Icons.public_outlined,
//                       value: country,
//                       items: countries,
//                       onChanged: (value) {
//                         setState(() {
//                           country = value;
//                           state = null;
//                           city = null;
//                           village = null;
//                         });

//                         loadStates(value);
//                       },
//                     ),

//                     SizedBox(height: 12.h),

//                     // STATE
//                     AppDropdown(
//                       label: AppStrings.state,
//                       hint: country == null
//                           ? AppStrings.selectCountryFirst
//                           : AppStrings.selectState,
//                       icon: Icons.location_city_outlined,
//                       value: state,
//                       items: states,
//                       onChanged: country == null
//                           ? null
//                           : (value) {
//                               setState(() {
//                                 state = value;
//                                 city = null;
//                                 village = null;
//                               });

//                               loadCities(value);
//                             },
//                     ),

//                     SizedBox(height: 12.h),

//                     // CITY
//                     AppDropdown(
//                       label: AppStrings.city,
//                       hint: state == null
//                           ? AppStrings.selectStateFirst
//                           : AppStrings.selectCity,
//                       icon: Icons.business_outlined,
//                       value: city,
//                       items: cities,
//                       onChanged: state == null
//                           ? null
//                           : (value) {
//                               setState(() {
//                                 city = value;
//                                 village = null;
//                               });

//                               loadVillages(value);
//                             },
//                     ),

//                     SizedBox(height: 12.h),

//                     // VILLAGE / AREA
//                     AppDropdown(
//                       label: AppStrings.villageOrArea,
//                       hint: city == null
//                           ? AppStrings.selectCityFirst
//                           : AppStrings.selectVillageOrArea,
//                       icon: Icons.holiday_village_outlined,
//                       value: village,
//                       items: villages,
//                       onChanged: city == null
//                           ? null
//                           : (value) {
//                               setState(() {
//                                 village = value;
//                               });
//                             },
//                     ),

//                     SizedBox(height: 12.h),

//                     // PIN
//                     AppTextField(
//                       controller: pinController,
//                       label: AppStrings.pinCode,
//                       hint: AppStrings.enterPinCode,
//                       icon: Icons.pin_drop_outlined,
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         final pin = value?.trim() ?? '';

//                         if (pin.isEmpty) {
//                           return AppStrings.enterPinCode;
//                         }

//                         if (pin.length != 6) {
//                           return AppStrings.enterPinCode;
//                         }

//                         return null;
//                       },
//                     ),

//                     SizedBox(height: 26.h),

//                     // ==================================================
//                     // DELIVERY ADDRESS
//                     // ==================================================
//                     _sectionTitle(
//                       icon: Icons.home_outlined,
//                       title: AppStrings.deliveryAddress,
//                     ),

//                     SizedBox(height: 14.h),

//                     AppTextField(
//                       controller: addressController,
//                       label: AppStrings.address,
//                       hint: AppStrings.enterAddress,
//                       icon: Icons.home_outlined,
//                       maxLines: 4,
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return AppStrings.enterAddress;
//                         }

//                         if (value.trim().length < 5) {
//                           return AppStrings.enterAddress;
//                         }

//                         return null;
//                       },
//                     ),

//                     SizedBox(height: 7.h),

//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       child: Text(
//                         AppStrings.deliveryAddressSubtitle,
//                         style: AppTextStyles.bodySmall,
//                       ),
//                     ),

//                     SizedBox(height: 14.h),

//                     AppTextField(
//                       controller: landmarkController,
//                       label: AppStrings.nearbyLandmark,
//                       hint: AppStrings.nearbyLandmarkHint,
//                       icon: Icons.place_outlined,
//                     ),

//                     SizedBox(height: 26.h),

//                     // ==================================================
//                     // ADDRESS TYPE
//                     // ==================================================
//                     _sectionTitle(
//                       icon: Icons.bookmark_outline_rounded,
//                       title: AppStrings.addressType,
//                     ),

//                     SizedBox(height: 12.h),

//                     AddressTypeSelector(
//                       value: addressType,
//                       onChanged: (value) {
//                         setState(() {
//                           addressType = value;
//                         });
//                       },
//                     ),

//                     SizedBox(height: 10.h),
//                   ],
//                 ),
//               ),
//             ),

//             // ========================================================
//             // SAVE BUTTON
//             // ========================================================
//             _SaveAddressButton(isLoading: isSaving, onPressed: saveAddress),
//           ],
//         ),
//       ),
//     );
//   }

//   // ============================================================
//   // SECTION TITLE
//   // ============================================================

//   Widget _sectionTitle({required IconData icon, required String title}) {
//     return Row(
//       children: [
//         Container(
//           width: 34.w,
//           height: 34.w,
//           decoration: BoxDecoration(
//             color: AppColors.primary.withValues(alpha: 0.08),
//             borderRadius: BorderRadius.circular(10.r),
//           ),
//           child: Icon(icon, size: 18.sp, color: AppColors.primary),
//         ),
//         SizedBox(width: 10.w),
//         Text(title, style: AppTextStyles.headingSmall),
//       ],
//     );
//   }
// }

// // ==================================================================
// // CURRENT LOCATION BUTTON
// // ==================================================================

// class _CurrentLocationButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool isLoading;

//   const _CurrentLocationButton({
//     required this.onPressed,
//     required this.isLoading,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: isLoading ? null : onPressed,
//         borderRadius: BorderRadius.circular(14.r),
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(14.w),
//           decoration: BoxDecoration(
//             color: AppColors.primary.withValues(alpha: 0.05),
//             borderRadius: BorderRadius.circular(14.r),
//             border: Border.all(
//               color: AppColors.primary.withValues(alpha: 0.15),
//             ),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 44.w,
//                 height: 44.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary.withValues(alpha: 0.10),
//                   shape: BoxShape.circle,
//                 ),
//                 child: isLoading
//                     ? Padding(
//                         padding: EdgeInsets.all(12.w),
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2.2,
//                           color: AppColors.primary,
//                         ),
//                       )
//                     : Icon(
//                         Icons.my_location_rounded,
//                         color: AppColors.primary,
//                         size: 21.sp,
//                       ),
//               ),

//               SizedBox(width: 12.w),

//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       isLoading
//                           ? 'Detecting location...'
//                           : AppStrings.useCurrentLocation,
//                       style: AppTextStyles.headingSmall.copyWith(
//                         fontSize: 14.sp,
//                       ),
//                     ),

//                     SizedBox(height: 3.h),

//                     Text(
//                       AppStrings.useCurrentLocationSubtitle,
//                       style: AppTextStyles.bodySmall,
//                     ),
//                   ],
//                 ),
//               ),

//               if (!isLoading)
//                 Icon(
//                   Icons.arrow_forward_ios_rounded,
//                   size: 15.sp,
//                   color: AppColors.textSecondary,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ==================================================================
// // SAVE BUTTON
// // ==================================================================

// class _SaveAddressButton extends StatelessWidget {
//   final bool isLoading;
//   final VoidCallback onPressed;

//   const _SaveAddressButton({required this.isLoading, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.06),
//             blurRadius: 12,
//             offset: const Offset(0, -3),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         top: false,
//         child: SizedBox(
//           width: double.infinity,
//           height: 50.h,
//           child: ElevatedButton(
//             onPressed: isLoading ? null : onPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary,
//               disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
//               foregroundColor: AppColors.white,
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (isLoading) ...[
//                   SizedBox(
//                     width: 18.w,
//                     height: 18.w,
//                     child: const CircularProgressIndicator(
//                       strokeWidth: 2,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(width: 9.w),
//                   Text('Saving...', style: AppTextStyles.button),
//                 ] else ...[
//                   Icon(Icons.check_rounded, size: 20.sp),
//                   SizedBox(width: 8.w),
//                   Text(AppStrings.saveAddress, style: AppTextStyles.button),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/models/location_model.dart';
import '../../data/services/location_service.dart';
import '../widgets/location_dropdown.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // ============================================================
  // FORM
  // ============================================================

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController villageController = TextEditingController();

  final TextEditingController pinController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController landmarkController = TextEditingController();

  // ============================================================
  // COUNTRY
  // ============================================================

  static const String selectedCountry = 'India';

  // ============================================================
  // LOCATION DATA
  // ============================================================

  List<LocationItem> states = [];
  List<LocationItem> cities = [];

  String? selectedState;
  String? selectedCity;

  // ============================================================
  // LOADING
  // ============================================================

  bool stateLoading = false;
  bool cityLoading = false;
  bool isGettingLocation = false;

  // ============================================================
  // ADDRESS TYPE
  // ============================================================
  final Geocoding _geocoding = Geocoding();
  String addressType = 'Home';

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    _loadStates();
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    villageController.dispose();
    pinController.dispose();
    addressController.dispose();
    landmarkController.dispose();

    super.dispose();
  }

  // ============================================================
  // LOAD STATES
  // ============================================================

  Future<void> _loadStates() async {
    if (stateLoading) {
      return;
    }

    setState(() {
      stateLoading = true;
    });

    try {
      final result = await LocationService.getStates(selectedCountry);

      if (!mounted) {
        return;
      }

      setState(() {
        states = _removeDuplicateLocations(result);
      });
    } catch (e) {
      if (!mounted) {
        return;
      }

      _showError('Unable to load states. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          stateLoading = false;
        });
      }
    }
  }

  // ============================================================
  // LOAD CITIES
  // ============================================================

  Future<void> _loadCities(String state) async {
    if (cityLoading) {
      return;
    }

    setState(() {
      cityLoading = true;
      cities = [];
      selectedCity = null;
    });

    try {
      final result = await LocationService.getCities(
        country: selectedCountry,
        state: state,
      );

      if (!mounted) {
        return;
      }

      setState(() {
        cities = _removeDuplicateLocations(result);
      });
    } catch (e) {
      if (!mounted) {
        return;
      }

      _showError('Unable to load cities. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          cityLoading = false;
        });
      }
    }
  }

  // ============================================================
  // REMOVE DUPLICATES
  // ============================================================

  List<LocationItem> _removeDuplicateLocations(List<LocationItem> items) {
    final Map<String, LocationItem> unique = {};

    for (final item in items) {
      final key = item.name.trim().toLowerCase();

      if (key.isNotEmpty) {
        unique[key] = item;
      }
    }

    return unique.values.toList();
  }

  // ============================================================
  // ADD VALUE IF NOT PRESENT
  // ============================================================

  void _addStateIfMissing(String stateName) {
    final exists = states.any(
      (item) =>
          item.name.trim().toLowerCase() == stateName.trim().toLowerCase(),
    );

    if (!exists) {
      states = [...states, LocationItem(name: stateName)];
    }
  }

  void _addCityIfMissing(String cityName) {
    final exists = cities.any(
      (item) => item.name.trim().toLowerCase() == cityName.trim().toLowerCase(),
    );

    if (!exists) {
      cities = [...cities, LocationItem(name: cityName)];
    }
  }

  // ============================================================
  // CURRENT LOCATION
  // ============================================================

  Future<void> getCurrentLocation() async {
    if (isGettingLocation) {
      return;
    }

    // ----------------------------------------------------------
    // CONFIRMATION
    // ----------------------------------------------------------

    final shouldContinue = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Use Current Location?'),
          content: const Text(
            'Your current location will be used to automatically fill your address details.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );

    if (shouldContinue != true) {
      return;
    }

    setState(() {
      isGettingLocation = true;
    });

    try {
      // --------------------------------------------------------
      // LOCATION SERVICE
      // --------------------------------------------------------

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        if (!mounted) {
          return;
        }

        await _showLocationServiceDialog();
        return;
      }

      // --------------------------------------------------------
      // PERMISSION
      // --------------------------------------------------------

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      // --------------------------------------------------------
      // DENIED
      // --------------------------------------------------------

      if (permission == LocationPermission.denied) {
        if (!mounted) {
          return;
        }

        await _showPermissionDeniedDialog();
        return;
      }

      // --------------------------------------------------------
      // DENIED FOREVER
      // --------------------------------------------------------

      if (permission == LocationPermission.deniedForever) {
        if (!mounted) {
          return;
        }

        await _showPermissionDeniedForeverDialog();
        return;
      }

      // --------------------------------------------------------
      // GET GPS
      // --------------------------------------------------------

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // --------------------------------------------------------
      // REVERSE GEOCODING
      // --------------------------------------------------------

      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        throw Exception('Unable to detect address');
      }

      final place = placemarks.first;

      final detectedCountry = place.country?.trim();

      final detectedState = place.administrativeArea?.trim();

      final detectedCity = place.locality?.trim();

      final detectedArea = place.subLocality?.trim();

      final detectedPin = place.postalCode?.trim();

      // --------------------------------------------------------
      // ONLY INDIA
      // --------------------------------------------------------

      if (detectedCountry != null &&
          detectedCountry.isNotEmpty &&
          detectedCountry.toLowerCase() != 'india') {
        if (!mounted) {
          return;
        }

        _showError('Current location is outside India.');

        return;
      }

      // --------------------------------------------------------
      // STATE
      // --------------------------------------------------------

      if (detectedState != null && detectedState.isNotEmpty) {
        _addStateIfMissing(detectedState);

        selectedState = detectedState;

        // Load cities dynamically.
        try {
          final result = await LocationService.getCities(
            country: selectedCountry,
            state: detectedState,
          );

          cities = _removeDuplicateLocations(result);
        } catch (_) {
          cities = [];
        }
      }

      // --------------------------------------------------------
      // CITY
      // --------------------------------------------------------

      if (detectedCity != null && detectedCity.isNotEmpty) {
        _addCityIfMissing(detectedCity);

        selectedCity = detectedCity;
      }

      // --------------------------------------------------------
      // AREA / VILLAGE
      // --------------------------------------------------------

      if (detectedArea != null && detectedArea.isNotEmpty) {
        villageController.text = detectedArea;
      }

      // --------------------------------------------------------
      // PIN
      // --------------------------------------------------------

      if (detectedPin != null && detectedPin.isNotEmpty) {
        pinController.text = detectedPin;
      }

      // --------------------------------------------------------
      // FULL ADDRESS
      // --------------------------------------------------------

      final addressParts = <String>[];

      final name = place.name?.trim();
      final street = place.street?.trim();
      final thoroughfare = place.thoroughfare?.trim();
      final subThoroughfare = place.subThoroughfare?.trim();

      if (name != null && name.isNotEmpty) {
        addressParts.add(name);
      }

      if (street != null &&
          street.isNotEmpty &&
          !addressParts.contains(street)) {
        addressParts.add(street);
      }

      if (thoroughfare != null &&
          thoroughfare.isNotEmpty &&
          !addressParts.contains(thoroughfare)) {
        addressParts.add(thoroughfare);
      }

      if (subThoroughfare != null &&
          subThoroughfare.isNotEmpty &&
          !addressParts.contains(subThoroughfare)) {
        addressParts.add(subThoroughfare);
      }

      if (detectedArea != null &&
          detectedArea.isNotEmpty &&
          !addressParts.contains(detectedArea)) {
        addressParts.add(detectedArea);
      }

      if (detectedCity != null &&
          detectedCity.isNotEmpty &&
          !addressParts.contains(detectedCity)) {
        addressParts.add(detectedCity);
      }

      if (detectedState != null &&
          detectedState.isNotEmpty &&
          !addressParts.contains(detectedState)) {
        addressParts.add(detectedState);
      }

      if (detectedPin != null &&
          detectedPin.isNotEmpty &&
          !addressParts.contains(detectedPin)) {
        addressParts.add(detectedPin);
      }

      addressController.text = addressParts.join(', ');

      // --------------------------------------------------------
      // SUCCESS
      // --------------------------------------------------------

      if (!mounted) {
        return;
      }

      setState(() {});

      _showSuccess('Current location detected successfully.');
    } catch (e) {
      if (!mounted) {
        return;
      }

      _showError('Unable to detect your current location.');
    } finally {
      if (mounted) {
        setState(() {
          isGettingLocation = false;
        });
      }
    }
  }

  // ============================================================
  // LOCATION SERVICE OFF
  // ============================================================

  Future<void> _showLocationServiceDialog() async {
    final openSettings = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Location is Disabled'),
          content: const Text(
            'Please turn on Location Services to use your current location.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );

    if (openSettings == true) {
      await Geolocator.openLocationSettings();
    }
  }

  // ============================================================
  // PERMISSION DENIED
  // ============================================================

  Future<void> _showPermissionDeniedDialog() async {
    final openSettings = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Location Permission Required'),
          content: const Text(
            'Location permission was denied. Please allow location permission from app settings to use your current location.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );

    if (openSettings == true) {
      await Geolocator.openAppSettings();
    }
  }

  // ============================================================
  // PERMISSION DENIED FOREVER
  // ============================================================

  Future<void> _showPermissionDeniedForeverDialog() async {
    final openSettings = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Location Permission Blocked'),
          content: const Text(
            'Location permission has been permanently denied. Please enable Location permission from App Settings.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );

    if (openSettings == true) {
      await Geolocator.openAppSettings();
    }
  }

  // ============================================================
  // SAVE ADDRESS
  // ============================================================

  void _saveAddress() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final addressData = {
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'country': selectedCountry,
      'state': selectedState,
      'city': selectedCity,
      'village_area': villageController.text.trim(),
      'pin': pinController.text.trim(),
      'address': addressController.text.trim(),
      'landmark': landmarkController.text.trim(),
      'address_type': addressType,
    };

    debugPrint('ADDRESS DATA: $addressData');

    _showSuccess('Address saved successfully.');

    // ----------------------------------------------------------
    // এখানে তোমার API / Provider / Repository call করবে
    // ----------------------------------------------------------
  }

  // ============================================================
  // SUCCESS
  // ============================================================

  void _showSuccess(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  // ============================================================
  // ERROR
  // ============================================================

  void _showError(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
  }

  // ============================================================
  // TEXT FIELD
  // ============================================================

  Widget _textField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Address')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =================================================
                // CURRENT LOCATION
                // =================================================
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: isGettingLocation ? null : getCurrentLocation,
                    icon: isGettingLocation
                        ? SizedBox(
                            width: 18.w,
                            height: 18.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const Icon(Icons.my_location),
                    label: Text(
                      isGettingLocation
                          ? 'Detecting Location...'
                          : 'Use Current Location',
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // =================================================
                // FULL NAME
                // =================================================
                _textField(
                  label: 'Full Name',
                  hint: 'Enter full name',
                  icon: Icons.person_outline,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter full name';
                    }

                    return null;
                  },
                ),

                // =================================================
                // PHONE
                // =================================================
                _textField(
                  label: 'Phone Number',
                  hint: 'Enter phone number',
                  icon: Icons.phone_outlined,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter phone number';
                    }

                    if (value.trim().length != 10) {
                      return 'Enter valid 10 digit phone number';
                    }

                    return null;
                  },
                ),

                // =================================================
                // COUNTRY
                // =================================================
                LocationDropdown(
                  label: 'Country',
                  hint: 'India',
                  icon: Icons.public,
                  items: const [LocationItem(name: 'India')],
                  value: selectedCountry,
                  enabled: false,
                  loading: false,
                  onChanged: (_) {},
                ),

                // =================================================
                // STATE
                // =================================================
                LocationDropdown(
                  label: 'State',
                  hint: stateLoading ? 'Loading states...' : 'Select state',
                  icon: Icons.location_city_outlined,
                  items: states,
                  value: selectedState,
                  loading: stateLoading,
                  enabled: !stateLoading && states.isNotEmpty,
                  onChanged: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }

                    setState(() {
                      selectedState = value;
                      selectedCity = null;
                      cities = [];
                    });

                    _loadCities(value);
                  },
                ),

                // =================================================
                // CITY / DISTRICT
                // =================================================
                LocationDropdown(
                  label: 'City / District',
                  hint: selectedState == null
                      ? 'Select state first'
                      : cityLoading
                      ? 'Loading cities...'
                      : 'Select city / district',
                  icon: Icons.location_on_outlined,
                  items: cities,
                  value: selectedCity,
                  loading: cityLoading,
                  enabled:
                      selectedState != null &&
                      !cityLoading &&
                      cities.isNotEmpty,
                  onChanged: (value) {
                    if (value == null || value.isEmpty) {
                      return;
                    }

                    setState(() {
                      selectedCity = value;
                    });
                  },
                ),

                // =================================================
                // VILLAGE / AREA
                // =================================================
                _textField(
                  label: 'Village / Area',
                  hint: 'Enter village or area',
                  icon: Icons.home_work_outlined,
                  controller: villageController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter village / area';
                    }

                    return null;
                  },
                ),

                // =================================================
                // PIN
                // =================================================
                _textField(
                  label: 'PIN Code',
                  hint: 'Enter PIN code',
                  icon: Icons.pin_drop_outlined,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter PIN code';
                    }

                    if (value.trim().length != 6) {
                      return 'Enter valid 6 digit PIN code';
                    }

                    return null;
                  },
                ),

                // =================================================
                // FULL ADDRESS
                // =================================================
                _textField(
                  label: 'Full Address',
                  hint: 'Enter full address',
                  icon: Icons.location_on_outlined,
                  controller: addressController,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter full address';
                    }

                    return null;
                  },
                ),

                // =================================================
                // LANDMARK
                // =================================================
                _textField(
                  label: 'Nearby Landmark',
                  hint: 'Enter nearby landmark',
                  icon: Icons.place_outlined,
                  controller: landmarkController,
                ),

                // =================================================
                // ADDRESS TYPE
                // =================================================
                Text(
                  'Address Type',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [
                    _addressTypeOption('Home', Icons.home_outlined),
                    SizedBox(width: 8.w),
                    _addressTypeOption('Work', Icons.work_outline),
                    SizedBox(width: 8.w),
                    _addressTypeOption('Other', Icons.location_on_outlined),
                  ],
                ),

                SizedBox(height: 24.h),

                // =================================================
                // SAVE
                // =================================================
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: _saveAddress,
                    child: const Text('Save Address'),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ADDRESS TYPE OPTION
  // ============================================================

  Widget _addressTypeOption(String type, IconData icon) {
    final selected = addressType == type;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            addressType = type;
          });
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              SizedBox(height: 4.h),
              Text(
                type,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
