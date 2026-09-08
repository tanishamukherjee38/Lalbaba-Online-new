import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/helpers/snackbar_helper.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../account/presentation/widgets/app_string.dart';
import '../widgets/address_dropdown_field.dart';
import '../widgets/address_header.dart';
import '../widgets/address_text_field.dart';

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

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final nameController = TextEditingController(text: 'Guest');
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();
  final pinController = TextEditingController();

  // ============================================================
  // LOCATION
  // ============================================================

  String? country;
  String? state;
  String? city;
  String? village;

  String addressType = 'Home';

  final countries = <String>['India', 'Bangladesh', 'Nepal'];

  final states = <String>[];
  final cities = <String>[];
  final villages = <String>[];

  // ============================================================
  // LOADING
  // ============================================================

  bool isSaving = false;
  bool isGettingLocation = false;

  // ============================================================
  // GEOCODING
  // ============================================================

  final Geocoding _geocoding = Geocoding();

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    landmarkController.dispose();
    pinController.dispose();

    super.dispose();
  }

  // ============================================================
  // LOAD STATES
  // ============================================================

  void loadStates(String? selectedCountry) {
    if (selectedCountry == null) return;

    final newStates = <String>[];

    switch (selectedCountry) {
      case 'India':
        newStates.addAll(['West Bengal', 'Bihar', 'Jharkhand', 'Odisha']);
        break;

      case 'Bangladesh':
        newStates.addAll(['Dhaka', 'Chattogram', 'Rajshahi', 'Khulna']);
        break;

      case 'Nepal':
        newStates.addAll(['Bagmati', 'Gandaki', 'Lumbini']);
        break;
    }

    setState(() {
      states
        ..clear()
        ..addAll(newStates);

      cities.clear();
      villages.clear();
    });
  }

  // ============================================================
  // LOAD CITIES
  // ============================================================

  void loadCities(String? selectedState) {
    if (selectedState == null) return;

    const citiesByState = <String, List<String>>{
      'West Bengal': ['Kolkata', 'Siliguri', 'Durgapur'],
      'Bihar': ['Patna', 'Gaya', 'Muzaffarpur'],
      'Jharkhand': ['Ranchi', 'Jamshedpur', 'Dhanbad'],
      'Odisha': ['Bhubaneswar', 'Cuttack', 'Rourkela'],
      'Dhaka': ['Dhaka', 'Gazipur', 'Narayanganj'],
      'Chattogram': ['Chattogram', "Cox's Bazar", 'Cumilla'],
      'Rajshahi': ['Rajshahi', 'Pabna', 'Natore'],
      'Khulna': ['Khulna', 'Jessore', 'Satkhira'],
      'Bagmati': ['Kathmandu', 'Lalitpur', 'Bhaktapur'],
      'Gandaki': ['Pokhara', 'Gorkha', 'Baglung'],
      'Lumbini': ['Butwal', 'Bhairahawa', 'Nepalgunj'],
    };

    setState(() {
      cities
        ..clear()
        ..addAll(citiesByState[selectedState] ?? const []);

      villages.clear();
    });
  }

  // ============================================================
  // LOAD VILLAGES / AREAS
  // ============================================================

  void loadVillages(String? selectedCity) {
    if (selectedCity == null) return;

    const villagesByCity = <String, List<String>>{
      'Kolkata': ['Salt Lake', 'Behala', 'Jadavpur'],
      'Siliguri': ['Matigara', 'Bagdogra', 'Sevoke'],
      'Durgapur': ['Bidhannagar', 'Benachity', 'City Centre'],
      'Patna': ['Kankarbagh', 'Rajendra Nagar', 'Danapur'],
      'Gaya': ['Bodh Gaya', 'Civil Lines', 'Manpur'],
      'Ranchi': ['Doranda', 'Harmu', 'Kanke'],
      'Bhubaneswar': ['Patia', 'Khandagiri', 'Sahid Nagar'],
      'Dhaka': ['Mirpur', 'Uttara', 'Dhanmondi'],
      'Chattogram': ['Pahartali', 'Agrabad', 'Halishahar'],
      'Rajshahi': ['Boalia', 'Motihar', 'Shah Makhdum'],
      'Khulna': ['Sonadanga', 'Khalishpur', 'Daulatpur'],
      'Kathmandu': ['Thamel', 'Baneshwor', 'Balaju'],
      'Lalitpur': ['Patan', 'Jawalakhel', 'Pulchowk'],
      'Bhaktapur': ['Suryabinayak', 'Thimi', 'Duwakot'],
      'Pokhara': ['Lakeside', 'Hemja', 'Simalchaur'],
      'Butwal': ['Golpark', 'Traffic Chowk', 'Kalikanagar'],
    };

    setState(() {
      villages
        ..clear()
        ..addAll(villagesByCity[selectedCity] ?? const []);
    });
  }

  // ============================================================
  // CURRENT LOCATION
  // ============================================================

  Future<void> getCurrentLocation() async {
    if (isGettingLocation) return;

    setState(() {
      isGettingLocation = true;
    });

    try {
      // ----------------------------------------------------------
      // CHECK LOCATION SERVICE
      // ----------------------------------------------------------

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        FeedbackHelper.showError(context, AppStrings.pleaseEnableLocation);
        return;
      }

      // ----------------------------------------------------------
      // CHECK PERMISSION
      // ----------------------------------------------------------

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        FeedbackHelper.showError(context, AppStrings.locationPermissionDenied);
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        FeedbackHelper.showError(
          context,
          AppStrings.locationPermissionDeniedForever,
        );
        return;
      }

      // ----------------------------------------------------------
      // GET GPS POSITION
      // ----------------------------------------------------------

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      // ----------------------------------------------------------
      // REVERSE GEOCODING
      // ----------------------------------------------------------

      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) {
        throw Exception('Address not found');
      }

      final place = placemarks.first;

      if (!mounted) return;

      // ----------------------------------------------------------
      // BUILD ADDRESS
      // ----------------------------------------------------------

      final addressParts =
          [place.name, place.street, place.thoroughfare, place.subThoroughfare]
              .where((value) => value != null && value.trim().isNotEmpty)
              .map((value) => value!.trim())
              .toList();

      // ----------------------------------------------------------
      // GET LOCATION VALUES
      // ----------------------------------------------------------

      final detectedCountry = place.country;
      final detectedState = place.administrativeArea;
      final detectedCity = place.locality;
      final detectedVillage = place.subLocality;

      // ----------------------------------------------------------
      // UPDATE BASIC VALUES
      // ----------------------------------------------------------

      setState(() {
        country = detectedCountry;
        state = detectedState;
        city = detectedCity;
        village = detectedVillage;

        pinController.text = place.postalCode ?? '';

        addressController.text = addressParts.join(', ');
      });

      // ----------------------------------------------------------
      // UPDATE DEPENDENT LISTS
      // ----------------------------------------------------------

      if (detectedCountry != null && countries.contains(detectedCountry)) {
        loadStates(detectedCountry);
      }

      if (detectedState != null) {
        loadCities(detectedState);
      }

      if (detectedCity != null) {
        loadVillages(detectedCity);
      }

      FeedbackHelper.showSuccess(context, AppStrings.currentLocationDetected);
    } catch (e) {
      if (!mounted) return;

      FeedbackHelper.showError(context, AppStrings.unableToDetectLocation);
    } finally {
      if (mounted) {
        setState(() {
          isGettingLocation = false;
        });
      }
    }
  }

  // ============================================================
  // SAVE ADDRESS
  // ============================================================

  Future<void> saveAddress() async {
    // ----------------------------------------------------------
    // FORM VALIDATION
    // ----------------------------------------------------------

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // ----------------------------------------------------------
    // LOCATION VALIDATION
    // ----------------------------------------------------------

    if (country == null || country!.trim().isEmpty) {
      FeedbackHelper.showError(context, AppStrings.selectCountryFirst);
      return;
    }

    if (state == null || state!.trim().isEmpty) {
      FeedbackHelper.showError(context, AppStrings.selectStateFirst);
      return;
    }

    if (city == null || city!.trim().isEmpty) {
      FeedbackHelper.showError(context, AppStrings.selectCityFirst);
      return;
    }

    if (village == null || village!.trim().isEmpty) {
      FeedbackHelper.showError(context, AppStrings.selectVillageOrArea);
      return;
    }

    // ----------------------------------------------------------
    // PREVENT DOUBLE SAVE
    // ----------------------------------------------------------

    if (isSaving) return;

    setState(() {
      isSaving = true;
    });

    try {
      // ========================================================
      // TODO:
      // API CALL WILL GO HERE
      // ========================================================

      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      FeedbackHelper.showSuccess(context, 'Address saved successfully');

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      FeedbackHelper.showError(context, 'Failed to save address');
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppAppBar(
        automaticallyImplyLeading: true,
        title: AppStrings.address,
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==================================================
                    // CURRENT LOCATION
                    // ==================================================
                    _CurrentLocationButton(
                      onPressed: getCurrentLocation,
                      isLoading: isGettingLocation,
                    ),

                    SizedBox(height: 26.h),

                    // ==================================================
                    // CONTACT INFORMATION
                    // ==================================================
                    _sectionTitle(
                      icon: Icons.person_outline_rounded,
                      title: AppStrings.contactInformation,
                    ),

                    SizedBox(height: 14.h),

                    AppTextField(
                      controller: nameController,
                      label: AppStrings.fullName,
                      hint: AppStrings.enterFullName,
                      icon: Icons.person_outline_rounded,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.enterFullName;
                        }

                        if (value.trim().length < 2) {
                          return AppStrings.enterFullName;
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 12.h),

                    AppTextField(
                      controller: phoneController,
                      label: AppStrings.phoneNumber,
                      hint: AppStrings.enterPhoneNumber,
                      icon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        final phone = value?.trim() ?? '';

                        if (phone.isEmpty) {
                          return AppStrings.enterPhoneNumber;
                        }

                        if (phone.length < 10) {
                          return AppStrings.enterPhoneNumber;
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 26.h),

                    // ==================================================
                    // LOCATION
                    // ==================================================
                    _sectionTitle(
                      icon: Icons.map_outlined,
                      title: AppStrings.location,
                    ),

                    SizedBox(height: 14.h),

                    // COUNTRY
                    AppDropdown(
                      label: AppStrings.country,
                      hint: AppStrings.selectCountry,
                      icon: Icons.public_outlined,
                      value: country,
                      items: countries,
                      onChanged: (value) {
                        setState(() {
                          country = value;
                          state = null;
                          city = null;
                          village = null;
                        });

                        loadStates(value);
                      },
                    ),

                    SizedBox(height: 12.h),

                    // STATE
                    AppDropdown(
                      label: AppStrings.state,
                      hint: country == null
                          ? AppStrings.selectCountryFirst
                          : AppStrings.selectState,
                      icon: Icons.location_city_outlined,
                      value: state,
                      items: states,
                      onChanged: country == null
                          ? null
                          : (value) {
                              setState(() {
                                state = value;
                                city = null;
                                village = null;
                              });

                              loadCities(value);
                            },
                    ),

                    SizedBox(height: 12.h),

                    // CITY
                    AppDropdown(
                      label: AppStrings.city,
                      hint: state == null
                          ? AppStrings.selectStateFirst
                          : AppStrings.selectCity,
                      icon: Icons.business_outlined,
                      value: city,
                      items: cities,
                      onChanged: state == null
                          ? null
                          : (value) {
                              setState(() {
                                city = value;
                                village = null;
                              });

                              loadVillages(value);
                            },
                    ),

                    SizedBox(height: 12.h),

                    // VILLAGE / AREA
                    AppDropdown(
                      label: AppStrings.villageOrArea,
                      hint: city == null
                          ? AppStrings.selectCityFirst
                          : AppStrings.selectVillageOrArea,
                      icon: Icons.holiday_village_outlined,
                      value: village,
                      items: villages,
                      onChanged: city == null
                          ? null
                          : (value) {
                              setState(() {
                                village = value;
                              });
                            },
                    ),

                    SizedBox(height: 12.h),

                    // PIN
                    AppTextField(
                      controller: pinController,
                      label: AppStrings.pinCode,
                      hint: AppStrings.enterPinCode,
                      icon: Icons.pin_drop_outlined,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        final pin = value?.trim() ?? '';

                        if (pin.isEmpty) {
                          return AppStrings.enterPinCode;
                        }

                        if (pin.length != 6) {
                          return AppStrings.enterPinCode;
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 26.h),

                    // ==================================================
                    // DELIVERY ADDRESS
                    // ==================================================
                    _sectionTitle(
                      icon: Icons.home_outlined,
                      title: AppStrings.deliveryAddress,
                    ),

                    SizedBox(height: 14.h),

                    AppTextField(
                      controller: addressController,
                      label: AppStrings.address,
                      hint: AppStrings.enterAddress,
                      icon: Icons.home_outlined,
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.enterAddress;
                        }

                        if (value.trim().length < 5) {
                          return AppStrings.enterAddress;
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: 7.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        AppStrings.deliveryAddressSubtitle,
                        style: AppTextStyles.bodySmall,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    AppTextField(
                      controller: landmarkController,
                      label: AppStrings.nearbyLandmark,
                      hint: AppStrings.nearbyLandmarkHint,
                      icon: Icons.place_outlined,
                    ),

                    SizedBox(height: 26.h),

                    // ==================================================
                    // ADDRESS TYPE
                    // ==================================================
                    _sectionTitle(
                      icon: Icons.bookmark_outline_rounded,
                      title: AppStrings.addressType,
                    ),

                    SizedBox(height: 12.h),

                    AddressTypeSelector(
                      value: addressType,
                      onChanged: (value) {
                        setState(() {
                          addressType = value;
                        });
                      },
                    ),

                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),

            // ========================================================
            // SAVE BUTTON
            // ========================================================
            _SaveAddressButton(isLoading: isSaving, onPressed: saveAddress),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _sectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, size: 18.sp, color: AppColors.primary),
        ),
        SizedBox(width: 10.w),
        Text(title, style: AppTextStyles.headingSmall),
      ],
    );
  }
}

// ==================================================================
// CURRENT LOCATION BUTTON
// ==================================================================

class _CurrentLocationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const _CurrentLocationButton({
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.15),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: isLoading
                    ? Padding(
                        padding: EdgeInsets.all(12.w),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: AppColors.primary,
                        ),
                      )
                    : Icon(
                        Icons.my_location_rounded,
                        color: AppColors.primary,
                        size: 21.sp,
                      ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLoading
                          ? 'Detecting location...'
                          : AppStrings.useCurrentLocation,
                      style: AppTextStyles.headingSmall.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      AppStrings.useCurrentLocationSubtitle,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ),

              if (!isLoading)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15.sp,
                  color: AppColors.textSecondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================================================================
// SAVE BUTTON
// ==================================================================

class _SaveAddressButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _SaveAddressButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 18.w,
                    height: 18.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Text('Saving...', style: AppTextStyles.button),
                ] else ...[
                  Icon(Icons.check_rounded, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(AppStrings.saveAddress, style: AppTextStyles.button),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
