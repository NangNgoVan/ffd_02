(function($){
  $.fn.clickCounter = function(e) {
    fieldName = this.attr('data-field');
    type = this.attr('data-type');
    var input = $('input[name="'+fieldName+'"]');
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
      if(type == 'minus') {
        if(currentVal > input.attr('min')) {
          input.val(currentVal - 1).change();
        }
        if(parseInt(input.val()) == input.attr('min')) {
          this.attr('disabled', true);
        }
      }
      else if(type == 'plus') {
        if(currentVal < input.attr('max')) {
        input.val(currentVal + 1).change();
        }
        if(parseInt(input.val()) == input.attr('max')) {
          this.attr('disabled', true);
        }
      }
    } else {
      input.val(0);
    }
    $('#sum').html($('#product-price-modal').html()*input.val());
  };

  $.fn.changeValue = function() {
    minValue =  parseInt(this.attr('min'));
    maxValue =  parseInt(this.attr('max'));
    valueCurrent = parseInt(this.val());
    name = this.attr('name');
    if(valueCurrent >= minValue) {
        $('.btn-number[data-type="minus"][data-field="'+name+'"]')
          .removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        this.val(this.data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $('.btn-number[data-type="plus"][data-field="'+name+'"]')
          .removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        this.val(this.data('oldValue'));
    }
  };

  $.fn.showDetailOrder = function() {
    var orderID = JSON.parse($(this).attr('data-order'));
    $.ajax({
      type: 'get',
      url: '/orders/'+orderID+'.js',
      dataType: 'html'
    })
    .done(function(data) {
      $('#detail-order').find(".modal-body").html(data);
      $('#detail-order').modal();
      console.log(data);
    })
    .fail(function(){alert(I18n.t('loi'))});
  };

}(jQuery))

$(function() {
  $('.btn-order').click(function() {
    var product = JSON.parse($(this).attr('data-product'));
    $('#product-id-modal').val(product.id);
    $('#product-label-modal').html(product.name);
    $('#product-price-modal').html(product.price);
    $('#product-picture-modal').html(product.image);
    $('sum').html(product.price);
    $('#order-modal').modal('show');
  });

});
