import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storapp/models/Product_model.dart';
import 'package:storapp/services/Allproducts.dart';

part 'getallproduct_state.dart';

class GetallproductCubit extends Cubit<GetallproductState> {
  GetallproductCubit() : super(GetallproductInitial());
//final ProductCard productCard;
  Future<void> fatchdata() async {
    emit(GetallproductIloading());

    try {
  List<ProductCard> data = await porductser(). fetchProducts();
   emit(Getallproduclaoded(data));
} on Exception catch (e) {
  // TODO
  emit(Getallproductfilure());
}

   
    
  }
}
