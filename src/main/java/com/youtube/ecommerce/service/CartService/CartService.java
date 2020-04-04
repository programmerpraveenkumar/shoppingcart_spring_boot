package com.youtube.ecommerce.service.CartService;

import java.util.List;

import org.springframework.stereotype.Service;

import com.youtube.ecommerce.model.AddtoCart;
import com.youtube.ecommerce.model.CheckoutCart;
import com.youtube.ecommerce.model.Products;
@Service
public interface CartService {
	List<AddtoCart> addCartbyUserIdAndProductId(long productId,long userId,int qty,double price) throws Exception;
	void updateQtyByCartId(long cartId,int qty,double price) throws Exception;
	List<AddtoCart> getCartByUserId(long userId);
	List<AddtoCart> removeCartByUserId(long cartId,long userId);
	List<AddtoCart> removeAllCartByUserId(long userId);
	Boolean checkTotalAmountAgainstCart(double totalAmount,long userId);
	List<CheckoutCart> getAllCheckoutByUserId(long userId);
	List<CheckoutCart> saveProductsForCheckout(List<CheckoutCart> tmp)  throws Exception;
	
	
	//CheckOutCart
}
