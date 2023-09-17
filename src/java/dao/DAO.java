package dao;

import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.Product;
import entity.Category;
import entity.Item;
import entity.Order;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DAO extends DBContext {

    public Account checkLogin(String user, String pass) {
        PreparedStatement st;
        ResultSet rs;
        String sql = "SELECT * FROM Account "
                + "WHERE username = ? "
                + "AND password = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            rs = st.executeQuery();
            if (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                int role = rs.getInt(3);
                String fullname = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String address = rs.getString(7);
                Account account = new Account(username,
                        password,
                        role,
                        fullname,
                        phone,
                        email,
                        address);
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Account> getAllAccount() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList<>();
        String sql = "select * from account \n"
                + "where role != 1\n"
                + "order by role";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                int role = rs.getInt(3);
                String fullname = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String address = rs.getString(7);
                list.add(new Account(username,
                        password,
                        role,
                        fullname,
                        phone,
                        email,
                        address));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account checkUsername(String user) {
        PreparedStatement st;
        ResultSet rs;
        String sql = "SELECT * FROM Account "
                + "WHERE username = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            rs = st.executeQuery();
            if (rs.next()) {
                String username = rs.getString(1);
                Account account = new Account(username);
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void createAccount(String user, String pass, String fullname) {
        PreparedStatement st;
        String sql = "INSERT INTO Account(username, password, role, fullname) "
                + "VALUES(?, ?, ?, ?)";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setInt(3, 3);
            st.setString(4, fullname);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Product> getAllProduct() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM Product";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> paginationProduct(int index) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList<>();
        String sql = "SELECT * FROM Product\n"
                + "ORDER BY product_id\n"
                + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Category> getAllCategory() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList<>();
        String sql = "SELECT * FROM Category ORDER BY name";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByPid(int id) {
        PreparedStatement st;
        ResultSet rs;
        Product p = null;
        String sql = "SELECT * "
                + "FROM Product "
                + "WHERE product_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                p = new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }

    public ArrayList getTopProducts() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "select top 3 i.* from Orders o\n"
                + "join Item i\n"
                + "on o.order_id = i.order_id\n"
                + "where o.status = 'completed'\n"
                + "order by i.quantity desc";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Item(getProductByPid(rs.getInt(3)),
                        rs.getInt(4),
                        rs.getDouble(6))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList getProductByCid(int id) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT * "
                + "FROM Product "
                + "WHERE category_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getCreatedOrderId() {
        PreparedStatement st;
        ResultSet rs;
        int orderId = 0;
        String sql = "SELECT MAX(order_id) FROM Orders";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return orderId;
    }

    public ArrayList<Item> getOrderItem(int orderId) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT * FROM Item "
                + "WHERE order_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Item(getProductByPid(rs.getInt(3)),
                        rs.getInt(4),
                        rs.getDouble(6))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Item> getPendingItems() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "select i.* from Orders o\n"
                + "join Item i\n"
                + "on o.order_id = i.order_id\n"
                + "where o.status = 'pending'";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Item(getProductByPid(rs.getInt(3)),
                        rs.getInt(4),
                        rs.getDouble(6))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getAllUserOrder(String username) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT * FROM Orders "
                + "WHERE username = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getDouble(8),
                        rs.getDate(7).toLocalDate())
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Order> getAllOrder() {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT * FROM Orders";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(9),
                        rs.getDouble(8),
                        rs.getDate(7).toLocalDate())
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> searchProductByName(String name) {
        PreparedStatement st;
        ResultSet rs;
        ArrayList list = new ArrayList();
        String sql = "SELECT * "
                + "FROM Product "
                + "WHERE name like ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addItemToOrder(int orderId, List<Item> items) {
        for (Item item : items) {
            PreparedStatement st;
            String sql = "INSERT INTO Item(order_id, product_id, quantity, price, subtotal) "
                    + "VALUES(?, ?, ?, ?, ?)";
            try {
                st = connection.prepareStatement(sql);
                st.setInt(1, orderId);
                st.setInt(2, item.getP().getProductId());
                st.setInt(3, item.getQuantity());
                st.setDouble(4, item.getP().getPrice());
                st.setDouble(5, item.getSubtotal());
                st.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public void updateUserInfo(String fullmame, String phone, String email, String address, String username) {
        PreparedStatement st;
        String sql = "UPDATE Account "
                + "SET fullname = ?, phone = ?, email = ?, address = ? "
                + "WHERE username = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, fullmame);
            st.setString(2, phone);
            st.setString(3, email);
            st.setString(4, address);
            st.setString(5, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRole(int role, String username) {
        PreparedStatement st;
        String sql = "UPDATE Account "
                + "SET role = ? "
                + "WHERE username = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, role);
            st.setString(2, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void createOrder(String username, String fullname, String phone, String email, String address, double total) {
        PreparedStatement st;
        LocalDateTime currentDate = LocalDateTime.now();
        String sql = "INSERT INTO Orders(username, customer_name, customer_phone, customer_email, customer_address, order_date, total, status) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, fullname);
            st.setString(3, phone);
            st.setString(4, email);
            st.setString(5, address);
            st.setTimestamp(6, Timestamp.valueOf(currentDate));
            st.setDouble(7, total);
            st.setString(8, "pending");
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProductQuantity(int quantity, int product_id) {
        PreparedStatement st;
        String sql = "UPDATE Product "
                + "SET quantity = ? "
                + "WHERE product_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, product_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrderStatus(String status, int orderId) {
        PreparedStatement st;
        String sql = "UPDATE Orders "
                + "SET status = ? "
                + "WHERE order_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addProduct(String name, String description, double price, int quantity, int categoryId, String img, String demo) {
        PreparedStatement st;
        String sql = "INSERT INTO Product(name, description, price, quantity, category_id, img, demo) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?)";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setDouble(3, price);
            st.setInt(4, quantity);
            st.setInt(5, categoryId);
            st.setString(6, img);
            st.setString(7, demo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteProduct(int productId) {
        PreparedStatement st;
        String sql = "DELETE FROM Product "
                + "WHERE product_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(String name, String description, double price, int quantity, int categoryId, String img, int productId) {
        PreparedStatement st;
        String sql = "UPDATE Product "
                + "SET name = ?, description = ?, price = ?, quantity = ?, category_id = ?, img = ? "
                + "WHERE product_id = ?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, description);
            st.setDouble(3, price);
            st.setInt(4, quantity);
            st.setInt(5, categoryId);
            st.setString(6, img);
            st.setInt(7, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addCategory(String name) {
        PreparedStatement st;
        String sql = "INSERT INTO Category(name) "
                + "VALUES(?)";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getLastCategoryId() {
        PreparedStatement st;
        ResultSet rs;
        int cid = 0;
        String sql = "SELECT MAX(category_id) FROM Category";
        try {
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                cid = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cid;
    }
}
