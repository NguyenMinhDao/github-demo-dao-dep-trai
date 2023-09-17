package entity;

import java.util.List;

/**
 *
 * @author bcd12
 */
public class Cart {

    private List<Item> items;

    public Cart() {
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

}
