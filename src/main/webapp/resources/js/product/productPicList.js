const deleteButtons = document.querySelectorAll('.shoping__cart__item__close .icon_close');

// Add a click event listener to each "x" button
deleteButtons.forEach(button => {
  button.addEventListener('click', function() {
    // Get the parent element of the "x" button, which is the table cell containing the product information
    const cartItem = this.closest('.shoping__cart__item');

    // Remove the table row containing the product information from the cart
    cartItem.parentNode.removeChild(cartItem);
  });
});

function checkAll() {
    var checkboxes = document.getElementsByName('chk');
    var totalPrice = 0;
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = document.getElementById('cbx_chkAll').checked;
      if (checkboxes[i].checked) {
        totalPrice += parseInt(checkboxes[i].parentNode.nextSibling.textContent.replace(",", ""));
      }
    }
    document.getElementById('totalPrice').textContent = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }