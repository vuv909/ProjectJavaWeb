/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.SuccessfullOrder;

/**
 *
 * @author vuv90
 */
public class SuccessShipDAO extends DBContext {

    public List<SuccessfullOrder> getAllproduct() {

        List<SuccessfullOrder> fs = new ArrayList<>();
        String spl = "Select ProductName, productimage,Sum(Quantity) as TotalQuantity,productprice\n"
                + "From  OrderDetail\n"
                + "where status = N'Giao hàng thành công'\n"
                + "Group by ProductName , productimage , productprice";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SuccessfullOrder p = new SuccessfullOrder(rs.getString(1), rs.getString(2),
                        rs.getInt(3), rs.getDouble(4));
                fs.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;

    }
    public static void main(String[] args) {
        SuccessShipDAO ssdao =new SuccessShipDAO();
        System.out.println(ssdao.getAllproduct());
    }
}
