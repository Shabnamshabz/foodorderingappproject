class Api{
  static const base = 'http://192.168.0.172:8000/api';
  static const register = '$base/customerreg';
  static const login='$base/customerlogin';
  static const fetchcategory='$base/fetchallcategory';
  static const fetchallproducts='$base/fetchallproducts';
  static const displaycategory='$base/categdisplay';
  static const fetchproductofcategory  ='$base/fetchproductofcategory';
  static const individualproductdisplay ='$base/individualproductdisplay';
  static const addtocartbutton='$base/addtocart';
  static const incrementquantity='$base/quantityaddtocart';
  static const decrementquantity='$base/decrementCartQuantity';
  static const deletecartitem ='$base/deletecart';
  static const usercartpagedisplay ='$base/displayusercart';
  static const paymentpage ='$base/paymentpage';
  static const getPayments='$base/getPayments';
  static const saveorder='$base/saveOrderDetails';
  static const updatecustomerdata ='$base/updatecustomerdata';
  static const signout ='$base/signout';
}