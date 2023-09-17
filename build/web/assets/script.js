function formatPhoneNumber(input) {
    // Remove all non-digit characters from the input
    var phoneNumber = input.value.replace(/\D/g, '');

    // Check if the phone number is empty
    if (phoneNumber.length === 0) {
        input.value = '';
        return;
    }

    // Format the phone number
    var formattedPhoneNumber = phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');

    // Set the formatted value back to the input field
    input.value = formattedPhoneNumber;
}
