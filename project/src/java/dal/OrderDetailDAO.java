/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import model.Cart;

/**
 *
 * @author vuv90
 */
public class OrderDetailDAO extends DBContext {

    public void saveCart(Map<Integer, Cart> carts, int orderId, String status) {
        String spl = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([order_id]\n"
                + "           ,[productprice]\n"
                + "           ,[productname]\n"
                + "           ,[productimage]\n"
                + "           ,[quantity]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, orderId);
            st.setString(6, status);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                st.setDouble(2, cart.getProduct().getPrice());
                st.setString(3, cart.getProduct().getName());
                st.setString(4, cart.getProduct().getImg());
                st.setInt(5, cart.getQuantity());

                st.executeUpdate();

            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrderStatus(int id, String status) {
        String sql = "UPDATE [dbo].[OrderDetail]\n"
                + "   SET [status] = ?\n"
                + "   where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public static void main(String[] args) {
        OrderDetailDAO oddao=new OrderDetailDAO();
        oddao.updateOrderStatus(1, "hello");
    }
}
