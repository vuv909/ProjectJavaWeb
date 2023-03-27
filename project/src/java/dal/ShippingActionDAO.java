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
import model.ShippingAction;

/**
 *
 * @author vuv90
 */
public class ShippingActionDAO extends DBContext {

    public List<ShippingAction> getAllShippingAction() {

        List<ShippingAction> fs = new ArrayList<>();
        String spl = "SELECT od.ID,s.name,[phone],[address],o.createdate,productname,p.price,productimage,od.quantity,status\n"
                + "                FROM [Order] o\n"
                + "                LEFT JOIN Shipping s ON s.ID = o.shippingID\n"
                + "                RIGHT JOIN [OrderDetail] od ON o.ID = od.order_id  left join Product p on od.productname = p.name";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShippingAction sa = new ShippingAction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                fs.add(sa);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;

    }

    public List<ShippingAction> getAllShippingActionByStatus(String status) {

        List<ShippingAction> fs = new ArrayList<>();
        String spl = "SELECT od.ID,s.name,[phone],[address],o.createdate,productname,p.price,productimage,od.quantity,status\n"
                + "                FROM [Order] o\n"
                + "                LEFT JOIN Shipping s ON s.ID = o.shippingID\n"
                + "                RIGHT JOIN [OrderDetail] od ON o.ID = od.order_id  left join Product p on od.productname = p.name \n"
                + "WHERE status = N'" + status + "'";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ShippingAction sa = new ShippingAction(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                fs.add(sa);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;

    }

    public static void main(String[] args) {
        ShippingActionDAO sadao = new ShippingActionDAO();
        System.out.println(sadao.getAllShippingActionByStatus("Đang chuẩn bị hàng"));
    }
}
