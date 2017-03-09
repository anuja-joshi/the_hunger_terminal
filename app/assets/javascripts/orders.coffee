# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->

  $(document).on "change", ".item-qty", ->
    quantity = parseInt($(this).val())
    product  = $(this).parent().parent()
    price    = parseInt(product.find('.price').text())
    product_name  = product.find(".product-name").text()
    vendor_name   = product.find(".vendor-name").text()
    product.find(".sub-total").text(quantity * price)
    menu_item_id = product.find('.menu_item_id').text()

    order_detail = {}
    order_detail.product_name = product_name
    order_detail.vendor_name  = vendor_name
    order_detail.total  = quantity * price
    order_detail.quantity = quantity
    order_detail.menu_item_id = menu_item_id

    selected_item = $('.order-details').find('*[data-menu-item-id="'+  menu_item_id + '"]')
    if selected_item.length
        selected_item.find('#order_detail_qty').val(quantity)
    else
        template = $("#order_detail_template").html()
        od       = Mustache.render(template, order_detail)
        $('.order-details').append(od)  

