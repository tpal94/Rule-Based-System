$(document).ready(function() {
  $(".new_strategy").validate({
    rules: {
      'strategy[name]': {
        required: true,
      }
    },
    messages: {
      'strategy[name]': {
        required: "Please enter name of the strategy.",
      }
    },
    errorPlacement: function(error, element) {
      if (element.attr("name") == "strategy[name]" )
        error.insertBefore(".name_of_strategy_error");
      else
        error.insertAfter(element);
    }
  });

  $(".tag_filter").validate({
    rules: {
      'tag': {
        minlength: 3,
      }
    },
    messages: {
      'strategy[name]': {
        required: "Please enter atleast 3 characters.",
      }
    }
  });

  $(".start_and_end_date").validate({
    rules: {
      'rules[fromdate]': {
        required: true,
      },
      'rules[todate]': {
        required: true,
      },
      'rules[date]': {
        required: true,
      }
    },
    messages: {
      'rules[fromdate]': {
        required: "Please enter start date",
      },
      'rules[todate]': {
        required: "Please enter end date",
      },
      'rules[date]': {
        required: "Please enter date",
      }
    }
  });
});