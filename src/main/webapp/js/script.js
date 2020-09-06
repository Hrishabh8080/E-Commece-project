function add_to_cart(pid, pname, pprice) {

    let cart = localStorage.getItem("cart");
    if (cart === null) {

        let products = [];

        let product = {productId: pid, productName: pname, productquantity: 1, productPrice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //console.log("Product is added first time");
        showToast("Item is added to cart");
    } else {

        let pcart = JSON.parse(cart);
        let oldproduct = pcart.find((item) => item.productId === pid);
        if (oldproduct) {
            oldproduct.productquantity = oldproduct.productquantity + 1;
            pcart.map((item) => {

                if (item.productId === oldproduct.productId)
                {
                    item.productquantity === oldproduct.productquantity;
                }

            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is quantity increase");
            showToast(oldproduct.productName + " is quantity increase");
        } else {
            let product = {productId: pid, productName: pname, productquantity: 1, productPrice: pprice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added");
            showToast("Product is Added to cart, Quantity = " + oldproduct.productquantity);
        }

    }
    updateCart();
}


//update cart

function updateCart() {

    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    if (cart === null || cart.length === 0) {

        console.log("Cart is Empty!!!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3> Cart does not have any Item </h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
<table class='table'>
        <thead class='thead-light'>
        <tr>
           <th>Item Name</th>
           <th>Price</th>
           <th>Quantity</th>
           <th>Total Price</th>
           <th>Action</th>
        
        </tr>
        </thead>
`;
        let totalPrice = 0;
        cart.map((item) => {

            table += `<tr>
                            <td> ${item.productName} </td>
                            <td> ${item.productPrice} </td>
                            <td> ${item.productquantity} </td>
                            <td> ${item.productquantity * item.productPrice} </td>
                            <td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>
                                                        
        </tr>
`;
            totalPrice += item.productPrice * item.productquantity;
        });

        table = table +
                `<tr><td colspan='5' class='text-right font-weight-bold m5'> Total Price: ${totalPrice} </td></tr> </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
    }
}


function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newcart = cart.filter((item) => item.productId !== pid);

    localStorage.setItem("cart", JSON.stringify(newcart));
    updateCart();
    showToast("Item is remove to cart");
}

$(document).ready(function () {
    updateCart();
});


function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");

    }, 2000);
}

function goToCheckout() {
    window.location="checkout.jsp";

}

