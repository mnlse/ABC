$(document).on('turbolinks:load', function() {
  var jQElem = {
    form: $('#new_advertisement'),
    save: $('#save'),
    publish: $('#publish'),
    published: $('#advertisement_published'),
    title: $('#advertisement_title'),
    description: $('#advertisement_description'),
    category: $('#advertisement_category'),
    price: $('#advertisement_price'),
    main_image: $('#advertisement_main_image'),
    secondary_images: $('#secondary-images'),
    picture_fields: $('.picture_field'),
    picture_form_fields: $('.form-picture')
  };

  var validateFields = function() {
    var successfulValidation = true
    if( !jQElem.title.val() ) {
      toastr['warning']("You have to provide a title");
      jQElem.title.css("border", "1px solid red");
      jQElem.title.prop("placeholder", "Provide a title");
      successfulValidation = false
    }
    if( !jQElem.description.val() ) {
      toastr['warning']("You have to provide a description");
      jQElem.description.css("border", "1px solid red");
      jQElem.description.prop("placeholder", "Provide a description");
      successfulValidation = false
    }

    if( !jQElem.price.val() ) {
      toastr['warning']("You have to provide a price");
      jQElem.price.css("border", "1px solid red");
      jQElem.price.prop("placeholder", "Provide a price");
      successfulValidation = false
    }

    if( !jQElem.main_image.val() ) {
      toastr['warning']("You have to provide main image");
      jQElem.main_image.css("border", "1px solid red");
      jQElem.main_image.prop("placeholder", "Provide a main_image");
      successfulValidation = false
    }

    return successfulValidation;
  };

  var cocoonEvents = function() {
    var numOfFields = 0;
    jQElem.picture_form_fields.on('cocoon:after-insert', function(e, insertedItem) {
      numOfFields++;
      $(insertedItem).attr("data-id", numOfFields);
      if (numOfFields >= 10) {
        e.preventDefault();
      }
    });

    jQElem.picture_form_fields.on('cocoon:before-remove', function(e, removedItem) {
      var id = $(removedItem).data("id")
      var image = $('img[data-id="' + id + '"]');
      image.remove();
    });
  };

  var clickEvents = function() {
    jQElem.save.click(function(e) {
      e.preventDefault();
      if(validateFields() === true) {
        jQElem.form.trigger('submit');
      };
    });

    jQElem.publish.click(function(e) {
      e.preventDefault();
      jQElem.published.prop("checked", true);
      jQElem.save.click();
    });
  };

  var imagePreviews = function() {
    jQElem.picture_form_fields.change(function(e) {
      var target = $(e.target).closest('.nested-fields');
      var id = target.data("id");
      var $image = $('img[data-id="' + id + '"]');
      if ($image.length > 0) {
        $image.prop("src", URL.createObjectURL(e.target.files[0]));
      } else {
        var newImg = $("<img/>");
        newImg.attr("data-id", id);
        newImg.prop("src", URL.createObjectURL(e.target.files[0]));
        newImg.addClass("preview-img");
        $("#images").append(newImg);
      }
    });
  };

  var init = function() {
    clickEvents();
    cocoonEvents();
    imagePreviews();
  };

  init();
});
