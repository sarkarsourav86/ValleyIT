function validateForm() {
    $("#form1").validate({
        errorClass: "state-error",
        validClass: "state-success",
        errorElement: "em",
        rules: {
            TxtUserLastName: {
                required: true
            },
            TxtRoom: {
                required: true
            },
            TxtEmail: {
                required: true,
                email: true
            },
            TxtDate: {
                required: true
            },
            room: {
                required: true
            }

        },
        messages: {

            TxtUserLastName: {
                required: 'Please enter your last name.'
            },
            TxtRoom: {
                required: 'Please enter your room number.'
            },
            TxtEmail: {
                required: 'Please enter your email id'

            },
            TxtDate: {
                required: 'Please enter checkout date'
            },
            room: {
                required: 'Please select an option'
            }
        },
        highlight: function (element, errorClass, validClass) {
            $(element).closest('.field').addClass(errorClass).removeClass(validClass);
        },
        unhighlight: function (element, errorClass, validClass) {
            $(element).closest('.field').removeClass(errorClass).addClass(validClass);
        },
        errorPlacement: function (error, element) {
            if (element.is(":radio") || element.is(":checkbox")) {
                element.closest('.option-group').after(error);
            }
            else {
                error.insertAfter(element.parent());
            }
        }
    });
}