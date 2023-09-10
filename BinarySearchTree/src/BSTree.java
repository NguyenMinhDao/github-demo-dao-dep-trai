
import sun.misc.Queue;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author dangn
 */
public class BSTree {

    Node root;

    boolean isEmpty() {
        return root == null;
    }

    void insert(int x) {
        Node X = new Node(x);
        if (isEmpty()) {
            root = X;
        } else {
            Node p = root;
            while (p != null) {
                if (p.val > x) {
                    //tuc la x nam ban trai cua p
                    //kiem tra neu ben trai ko co con thi X la
                    //con cua p
                    if (p.left == null) {
                        p.left = X;
                        break;
                    } else {
                        p = p.left;
                    }
                } else if (p.val < x) {
                    //tuc la x nam ben phai cua p
                    //kiem tra neu ben phai cua p la rong
                    // thi X se la con phai cua P
                    if (p.right == null) {
                        p.right = X;
                        break;
                    } else {
                        p = p.right;
                    }
                } else {
                    break;
                }

            }
        }
    }

    void visited(Node p) {
        System.out.print(p.val + " ");
    }
    int count;

    void preOrder2(Node p) {
        if (p == null) {
            return;
        }
        if (p.left != null && p.right != null) {
            count++;
        }
        if (count == 2) {
            visited(p);
            return;
        }
        preOrder2(p.left);
        preOrder2(p.right);
    }

    void preOrder(Node p) {
        if (p == null) {
            return;
        }
        visited(p);
        preOrder(p.left);
        preOrder(p.right);
    }

    void inOrder2(Node p) {
        if (p == null) {
            return;
        }
        if (p.val % 2 == 0) {
            visited(p);
        }
        inOrder2(p.left);
        inOrder2(p.right);
    }

    void inOrder(Node p) {
        if (p == null) {
            return;
        }

        inOrder(p.left);
        visited(p);
        inOrder(p.right);
    }

    void postOrder(Node p) {
        if (p == null) {
            return;
        }
        postOrder(p.left);
        postOrder(p.right);
        visited(p);

    }

    void breathFirstOrder() throws InterruptedException {
        if (isEmpty()) {
            return; // Most important !!!!!
        }
        Queue q = new Queue();
        q.enqueue(root);
        while (!q.isEmpty()) {
            Node p = (Node) q.dequeue();
            if (p.left != null) {
                q.enqueue(p.left);
            }
            if (p.right != null) {
                q.enqueue(p.right);
            }
            visited(p);
        }
    }
    // Duyet theo preOrder
    //in ra node thu 2 co 2 con
    // Duyet theo inOrder
    //in ra cac node co gia tri chan

    int numOfChild(Node p) {
        if (p.right == null && p.left == null) {
            return 0;
        } else if (p.left != null && p.right == null) {
            return -1;
        } else if (p.left == null && p.right != null) {
            return 1;
        } else {
            return 2;
        }
    }

    void deleteByMerging(int x) {
        Node p = root;
        Node par = root;
        Node rightMost = root;
        if (isEmpty()) {
            return;
        }
        //Node cần xoá là root
        if (root.val == x) {
            if (numOfChild(root) == 0) {
                root = null;
            }
            if (numOfChild(root) == -1) {
                root = root.left;
            }
            if (numOfChild(root) == 1) {
                root = root.right;
            } else {
                rightMost = root.left;
                while (rightMost.right != null) {
                    rightMost = rightMost.right;
                }
                rightMost.right = root.right;
                root = root.left;
            }
        } else {
            while (p != null && p.val != x) {
                par = p;
                if (p.val > x) {
                    p = p.left;
                } else {
                    p = p.right;
                }
            }
            if (par.left == p) { // p là con trái của par
                if (numOfChild(p) == 0) // p ko có con
                {
                    par.left = null;
                } else if (numOfChild(p) == -1) // p chỉ có con trái
                {
                    par.left = p.left;
                } else if (numOfChild(p) == 1) // p chỉ có con phải
                {
                    par.left = p.right;
                } else {
                    rightMost = p.left;
                    while (rightMost.right != null) {
                        rightMost = rightMost.right;
                    }
                    rightMost.right = p.right;
                    par.left = p.left;
                }
            } else { // p là con phải của par
                if (numOfChild(p) == 0) {
                    par.right = null;
                } else if (numOfChild(p) == -1) {
                    par.right = p.left;
                } else if (numOfChild(p) == 1) {
                    par.right = p.right;
                } else {
                    rightMost = p.left;
                    while (rightMost.right != null) {
                        rightMost = rightMost.right;
                    }
                    rightMost.right = p.right;
                    par.right = p.left;
                }
            }
        }
    }

    //Duyet theo bread first
    //In node dau tien <10  co 2 con
    //Duyet theo in order
    //in node cuoi cung <10 co 2 con
    void breathFirstOrder2() throws InterruptedException {
        Queue q = new Queue();
        q.enqueue(root);
        while (!q.isEmpty()) {
            Node p = (Node) q.dequeue();
            if (p.left != null) {
                q.enqueue(p.left);
            }
            if (p.right != null) {
                q.enqueue(p.right);
            }
            if (numOfChild(p) == 2 && p.val < 10) {
                deleteByMerging(p.val);
                break;
            }
        }
    }

    void inOrder3(Node p) {
        if (p == null) {
            return;
        }
        if (numOfChild(p) == 2 && p.val < 10) {
            deleteByMerging(p.val);
        }
        inOrder(p.left);
        visited(p);
        inOrder(p.right);
    }

    void deleteByCopy(int x) {
        if (isEmpty()) {
            return;
        }
        Node p, par, rightmost;
        p = root;
        par = p;
        while (p != null && p.val != x) {
            par = p; //truoc khi chay xuong p --> tim dc par
            if (p.val > x) {
                p = p.left;
            } else {
                p = p.right;
            }
        }
        if (p == null) {
            return;
        }
        if (numOfChild(p) == 0) {
            if (par.left == p) {
                par.left = null;
            } else {
                par.right = null;
            }
            if (numOfChild(p) == 1) {
                if (par.left == p) {
                    par.left = p.right;
                } else {
                    par.right = p.right;
                }
            } else {
                Node parRightmost = p;
                rightmost = p.left;
                while (rightmost.right != null) {
                    parRightmost = rightmost;
                    rightmost = rightmost.right;
                }
                p.val = rightmost.val;
                if (parRightmost.left == rightmost) {
                    parRightmost.left = rightmost.left;
                } else {
                    parRightmost.right = rightmost.left;
                }
            }
        }
    }

    void rightleftRotate(int x) {
        Node par, p, q;
        p = root;
        par = p;
        while (p.val != x && p != null) {
            par = p;
            if (p.val > x) {
                p = p.left;
            } else {
                p = p.right; // da tim duoc p = par 
            }
        }
        if (p == null) {
            return; //khong ton tai x
        }
        if (p == root) {
            root = rightRotate(p);
        } else {
            if (par.left == p) {
                par.left = rightLeftRotate(p);
            } else {
                par.right = rightLeftRotate(p);
            }
        }
    }

    void leftRightRotate(int x) {
        Node par, p, q;
        p = root;
        par = p;
        while (p.val != x && p != null) {
            par = p;
            if (p.val > x) {
                p = p.left;
            } else {
                p = p.right; // da tim duoc p = par 
            }
        }
        if (p == null) {
            return; //khong ton tai x
        }
        if (p == root) {
            root = rightRotate(p);
        } else {
            if (par.left == p) {
                par.left = leftRightRotate(p);
            } else {
                par.right = leftRightRotate(p);
            }
        }
    }

    void rightRotate(int x) {
        Node par, p, q;
        p = root;
        par = p;
        while (p.val != x && p != null) {
            par = p;
            if (p.val > x) {
                p = p.left;
            } else {
                p = p.right; // da tim duoc p = par 
            }
        }
        if (p == null) {
            return; //khong ton tai x
        }
        if (p == root) {
            root = rightRotate(p);
        } else {
            if (par.left == p) {
                par.left = rightRotate(p);
            } else {
                par.right = rightRotate(p);
            }
        }
    }

    Node rightRotate(Node p) {
        if (p == null) {
            return null;
        }
        if (p.left == null) {
            return p;
        }
        Node q = p.left;
        p.left = q.right;
        q.right = p;
        return q; // q tro thanh root
    }

    Node leftRotate(Node p) {
        if (p == null) {
            return null;
        }
        if (p.right == null) {
            return p;
        }
        Node q = p.right;
        p.right = q.left;
        q.left = p;
        return q;
    }

    Node leftRightRotate(Node p) {
        Node q = leftRotate(p.left);
        p.left = q;
        return rightRotate(p);
    }

    Node rightLeftRotate(Node p) {
        Node q = rightRotate(p.right);
        p.right = q;
        return leftRotate(p);
    }

}
