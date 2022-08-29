import 'package:flutter/material.dart';
import 'package:zinotalens/controller/address_controller.dart';
import 'package:zinotalens/model/address_list_model.dart';
import 'package:zinotalens/model/single_address_model.dart';
import 'package:zinotalens/widgets/error_widgets.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> _addresses = [];
  bool _isSaveAddrLoader = false;
  bool _isFetchAddrLoader = true;
  bool _isSingleAddrLoader = true;

  Address _defaultAddress = Address();
  SingleAddress _singleAddress = SingleAddress();

  Address get defaultAddress => _defaultAddress;
  SingleAddress get singleAddress => _singleAddress;

  bool get isSingleAddrLoader => _isSingleAddrLoader;
  set setSingleAddrLoader(bool _isSingleAddrLoader) {
    this._isSingleAddrLoader = _isSingleAddrLoader;
    notifyListeners();
  }

  bool get isSaveAddrLoader => _isSaveAddrLoader;
  set setSaveAddrLoader(bool _isSaveAddrLoader) {
    this._isSaveAddrLoader = _isSaveAddrLoader;
    notifyListeners();
  }

  bool get IsFetchAddrLoader => _isFetchAddrLoader;

  int get getAddressesLength => _addresses.length;
  List<Address> get getAddresses => _addresses;

  void getAddressListProvider({required String token}) async {
    try {
      _addresses = await fetchAddressList(token);
      makeDefaultAddress();
      _isFetchAddrLoader = false;
    } catch (e) {
      print("error no 297: $e");
      _isFetchAddrLoader = false;
    }
    notifyListeners();
  }

  void makeDefaultAddress() {
    if (getAddressesLength > 0) {
      _addresses.first.selected = true;
      _defaultAddress =
          _addresses.where((element) => element.selected == true).single;
    }
    notifyListeners();
  }

  void changeSelectedAddr(Address address, int index) {
    for (var address in _addresses) {
      address.selected = false;
    }
    address.selected = true;
    _addresses.removeAt(index);
    _addresses.insert(0, address);
    _defaultAddress =
        _addresses.where((element) => element.selected == true).single;
    notifyListeners();
  }

  void saveAddressProvider(BuildContext context,
      {required String token, required Address addressObj}) async {
    try {
      bool _isAddressSaved = await saveAddress(token, addressObj);
      if (_isAddressSaved) {
        _addresses.add(addressObj);
        makeDefaultAddress();
        showSnackBarMessage(context, "Address saved Successfully!");
      }
      _isSaveAddrLoader = false;
    } catch (e) {
      print("error no 349: $e");
      _isSaveAddrLoader = false;
    }
    notifyListeners();
  }

  void deleteAddressProvider(BuildContext context,
      {required String token,
      required String addressId,
      required int index}) async {
    try {
      bool _isDelete = await deleteAddress(token, addressId);
      if (_isDelete) {
        _addresses.removeAt(index);
        showSnackBarMessage(context, "address has been deleted");
      }
    } catch (e) {
      print("error no 176: $e");
    }
    notifyListeners();
  }

  void fetchSingleAddressProvider(
      {required String token, required String addressId}) async {
    try {
      _singleAddress = await fetchSingleAddress(token, addressId);
      _isSingleAddrLoader = false;
    } catch (e) {
      print("error no 476: $e");
      _isSingleAddrLoader = false;
    }
    notifyListeners();
  }

  void updateAddressProvider(
      {required String token,
      required String addressId,
      required int index,
      required BuildContext context,
      required Address addressObj}) async {
    try {
      bool _isUpdated = await updateAddress(token, addressId);
      if (_isUpdated) {}
    } catch (e) {
      print("error no 466: $e");
    }
    notifyListeners();
  }
}
