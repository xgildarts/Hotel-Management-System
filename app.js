
let cashBtn = document.querySelector(".cash-btn");
let closeBtn = document.querySelector(".close-btn");
let closeBtn2 = document.querySelector(".close-btn-2");
let doneBtn = document.querySelector(".done-btn");
let doneBtn2 = document.querySelector(".done-btn-2");
let cardBtn = document.querySelector(".card-btn");
let room_number = document.querySelector(".roomNumber");

setInterval(() => {
    update_room_label();
}, 1000);

document.addEventListener("DOMContentLoaded", () => {
    checkExpiredRoom();
    update_room_label();
});


//Set room number boundaries
room_number.addEventListener("input", () => {

    room_num = parseInt(room_number.value);

    if(room_num > 20) {
        room_number.value = 20;
        console.log("Out of bounds!");
    } else if(room_num < 1) {
        room_number.value = 1;
    }

});

//---------------------------------Inserting main form data to database -------------------START---------------------------------------------
document.querySelector("form").addEventListener("submit", (e) => {

    e.preventDefault();

    let TID = document.querySelector('#TID');
    let CID = document.querySelector('#CID');
    let name = document.querySelector('#name');
    let CNO = document.querySelector('#CNO');
    let standardRoom = document.querySelector('#standard-room');
    let deluxeRoom = document.querySelector('#deluxe-room');
    let roomNumber = document.querySelector(".roomNumber");
    let checkInDate = document.querySelector('#check-in-date');
    let checkInTime = document.querySelector("#check-in-time");
    let checkOutDate = document.querySelector('#check-out-date');
    let checkOutTime = document.querySelector("#check-out-time");
    let option = "";

    if(standardRoom.checked) {
        option = "Standard Room";
    } else if(deluxeRoom.checked){
        option = "Deluxe Room";
    } else {
        window.alert("Please select a room type!");
        return;
    }

    console.log(option);

    if (    CID.value == "" 
        || name.value == "" 
        || CNO.value == "" 
        || checkInDate.value == "" 
        || checkInTime.value == ""
        || roomNumber.value == ""
        || checkOutDate.value == ""
        || checkOutTime.value == "") {
        window.alert("Please fill the blank");
        return;
    }


    let payload = {

        cid: CID.value,
        name: name.value,
        cno: CNO.value,
        option: option,
        roomNumber: roomNumber.value,
        checkInDate: checkInDate.value,
        checkInTime: checkInTime.value,
        checkOutDate: checkOutDate.value,
        checkOutTime: checkOutTime.value

    }

    fetch("http://localhost/Hotel%20Management%20System/server.php", {
        method: "POST",
        headers: {
            'Content-type': 'application/json'
        },
        body: JSON.stringify(payload)
    })
    .then((res) => res.json())
    .then((val) => window.alert(val['status']))
    .catch((err) => console.log(err));

    fetch("http://localhost/Hotel%20Management%20System/expiration_date_api.php", {
        method: "POST",
        headers: {
            'Content-type': 'application/json'
        },
        body: JSON.stringify(payload)
    })
    .then((res) => res.json())
    .catch((err) => console.log(err));

    CID.value = "";
    name.value = "";
    CNO.value = "";
    standardRoom.value = "";
    roomNumber.value = "";
    checkInDate.value = "";
    checkInTime.value = "";
    checkOutDate.value = "";
    checkOutTime.value = "";

});

//If the customer room button clicked the selection of room whether Reserved or Available
document.getElementById("customer-room-btn").addEventListener("click", (e) => {
    e.preventDefault();
    let row7 = document.querySelector(".row-7");
    let drop_down_icon = document.querySelector(".drop_down_icon");
    row7.classList.toggle("showDisplay");
    if(row7.classList[1] == "showDisplay") {
        drop_down_icon.textContent = "🔼";
    } else {
        drop_down_icon.textContent = "🔽";
    }
    
});


// If the card button clicked  the modal will show
cardBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let modal2 = document.querySelector(".modal-2");
    modal2.style.display = 'flex';
});

// if the button cash clicked the cash payment method modal will show
cashBtn.addEventListener('click', (e) => {
    e.preventDefault();
    let modal = document.querySelector(".modal");
    modal.style.display = 'flex';
});

//Room Selection
let room_1 = document.querySelector("#room_1");
let room_2 = document.querySelector("#room_2");
let room_3 = document.querySelector("#room_3");
let room_4 = document.querySelector("#room_4");
let room_5 = document.querySelector("#room_5");
let room_6 = document.querySelector("#room_6");
let room_7 = document.querySelector("#room_7");
let room_8 = document.querySelector("#room_8");
let room_9 = document.querySelector("#room_9");
let room_10 = document.querySelector("#room_10");
let room_11 = document.querySelector("#room_11");
let room_12 = document.querySelector("#room_12");
let room_13 = document.querySelector("#room_13");
let room_14 = document.querySelector("#room_14");
let room_15 = document.querySelector("#room_15");
let room_16 = document.querySelector("#room_16");
let room_17 = document.querySelector("#room_17");
let room_18 = document.querySelector("#room_18");
let room_19 = document.querySelector("#room_19");
let room_20 = document.querySelector("#room_20");

let room1Label = document.querySelector(".room-01-label");
let room2Label = document.querySelector(".room-02-label");
let room3Label = document.querySelector(".room-03-label");
let room4Label = document.querySelector(".room-04-label");
let room5Label = document.querySelector(".room-05-label");
let room6Label = document.querySelector(".room-06-label");
let room7Label = document.querySelector(".room-07-label");
let room8Label = document.querySelector(".room-08-label");
let room9Label = document.querySelector(".room-09-label");
let room10Label = document.querySelector(".room-10-label");
let room11Label = document.querySelector(".room-11-label");
let room12Label = document.querySelector(".room-12-label");
let room13Label = document.querySelector(".room-13-label");
let room14Label = document.querySelector(".room-14-label");
let room15Label = document.querySelector(".room-15-label");
let room16Label = document.querySelector(".room-16-label");
let room17Label = document.querySelector(".room-17-label");
let room18Label = document.querySelector(".room-18-label");
let room19Label = document.querySelector(".room-19-label");
let room20Label = document.querySelector(".room-20-label");

roomArray = [
    room_1, room_2, room_3, room_4, room_5, room_6, room_7, room_8, room_9, room_10,
    room_11, room_12, room_13, room_14, room_15, room_16, room_17, room_18, room_19, room_20
];

roomLabelArray = [
    room1Label, room2Label, room3Label, room4Label, room5Label,
    room6Label, room7Label, room8Label, room9Label, room10Label,
    room11Label, room12Label, room13Label, room14Label, room15Label,
    room16Label, room17Label, room18Label, room19Label, room20Label
];


//Checking the expired room
function checkExpiredRoom() {

    let now = new Date();
    console.log(now);

    fetch("http://localhost/Hotel%20Management%20System/expiration_date_api.php")
    .then((response) => response.json())
    .then((val) => {

        let listOfExpiredDate = [];

        //Find the expired rooms
        for(let i = 0; i < val.length; i++) {
            let expiredDate = new Date(`${val[i][4]}T${val[i][3]}`);
            if(now >= expiredDate) {
                listOfExpiredDate.push(val[i][1]);
                console.log('Expired: ' + val[0][0]);
            } 
        }

        //Set the status of expired room to available
        for(let i = 0; i < listOfExpiredDate.length; i++) {

            let payload = {
                request: "insert",
                room_number: listOfExpiredDate[i],
                room_status: "Available"
            };
            fetch("http://localhost/Hotel%20Management%20System/customer_room_api.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(payload)
            })
            .then((res) => res.text())
            .then((val) => {
                console.log(val); update_room_label();
            }) 
            .catch((error) => console.log(error));
        }

        let payload = {
            room_expired: listOfExpiredDate
        };

        //Remove the expired room
        fetch("http://localhost/Hotel Management System/expiration_date_api.php", {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json"   
            },
            body: JSON.stringify(payload)
        })
        .then((res) => res.json())
        .then((val) => {console.log(val); update_room_label();})
        .catch((error) => console.log(error));

    })
    .catch((error) => console.log(error));

}



function update_room_label() {
    for(let i = 0; i < roomArray.length; i++) {
        let payload = {
            request: "get",
            room_number: i+1
        };
        fetch("http://localhost/Hotel%20Management%20System/customer_room_api.php", {
            method: "POST",
            headers: {
                "Content-type": "application/json"
            },
            body: JSON.stringify(payload)
        })
        .then((res) => res.json())
        .then((val) => {
            if(val[0] == "Available") {
                roomLabelArray[i].textContent = val[0];
                roomLabelArray[i].style.backgroundColor = "green";
            } else if(val[0] == "Used") {
                roomLabelArray[i].textContent = val[0];
                roomLabelArray[i].style.backgroundColor = "red";
            } else {
                roomLabelArray[i].textContent = val[0];
                roomLabelArray[i].style.backgroundColor = "orange";
            }
        })
        .catch((error) => console.error(error));
    }
}

for(let i = 0; i < roomArray.length; i++) {
    roomArray[i].addEventListener("change", () => {
        let payload = {
            request: "insert",
            room_number: i+1,
            room_status: roomArray[i].value
        };
        fetch("http://localhost/Hotel%20Management%20System/customer_room_api.php", {
            method: "POST",
            headers: {
                "Content-type": "application/json"
            },
            body: JSON.stringify(payload)
        })
        .then(() =>  update_room_label())
        .catch((error) => console.error(error));
    });
}




//---------------------------------Inserting main form data to database -------------------END---------------------------------------------



//Set initial value and quantity, price
document.querySelector(".room_quantity").value = 1;
document.querySelector(".room_price").value = 15000;


//---------------------------------------Inserting cash payment method to database-----------START-----------------------------------------------
doneBtn.addEventListener("click", (e) => {
    let cashier = document.querySelector(".cashier");
    let transactionNumber = document.querySelector(".transaction_number");
    let customerName = document.querySelector(".customer_name");
    let option = document.querySelector("#option");
    let roomQuantity = document.querySelector(".room_quantity");
    let roomPrice = document.querySelector(".room_price");
    let total = document.querySelector(".total");
    let amount = document.querySelector(".amount");
    let changes = document.querySelector(".changes");


    if (    cashier.value == "" 
        || customerName.value == "" 
        || option.value == "" 
        || roomQuantity.value == ""
        || roomPrice.value == ""
        || total.value == ""
        || amount.value == ""
        || changes.value == "") {
        window.alert("Please fill the blank");
        return;
    }

    let payload = {
        cashier: cashier.value,
        transactionNumber: transactionNumber.value,
        customerName: customerName.value,
        option: option.value,
        roomQuantity: roomQuantity.value,
        roomPrice: roomPrice.value,
        total: total.value,
        amount: amount.value,
        changes: changes.value
    };

    fetch("http://localhost/Hotel%20Management%20System/cash_form_api.php", {
        method: "POST",
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(payload)
    })
    .then((res) => res.json())
    .then((val) => {console.log(val); window.alert("Cash Payment Done.")})
    .catch((error) => console.error(error));

    cashier.value = "";
    transactionNumber.value = "";
    customerName.value = "";
    option.value = "";
    roomQuantity.value = "";
    roomPrice.value = "";
    total.value = "";
    amount.value = "";
    changes.value = "";

});

//Set room type whether Deluxe or Standard
let option = document.querySelector("#option");
option.addEventListener("change", () => {
    let roomPrice = document.querySelector(".room_price");
    if(option.value == "Standard") {
        roomPrice.value = 15000;
    } else if(option.value == "Deluxe") {
        roomPrice.value = 20000;
    }

});

//If the button Done click in cash payment method the modal will close


closeBtn.addEventListener("click", (e) => {
    e.preventDefault();
    let cashier = document.querySelector(".cashier");
    let transactionNumber = document.querySelector(".transaction_number");
    let customerName = document.querySelector(".customer_name");
    let option = document.querySelector("#option");
    let roomQuantity = document.querySelector(".room_quantity");
    let roomPrice = document.querySelector(".room_price");
    let total = document.querySelector(".total");
    let amount = document.querySelector(".amount");
    let changes = document.querySelector(".changes");

    cashier.value = "";
    transactionNumber.value = "";
    customerName.value = "";
    option.value = "";
    roomQuantity.value = "";
    roomPrice.value = "";
    total.value = "";
    amount.value = "";
    changes.value = "";

    let modal = document.querySelector(".modal");
    modal.style.display = 'none';
});

//Deducting the amount to total payment
let amount = document.querySelector(".amount");
amount.addEventListener('input', () => {
    let total = document.querySelector(".total");
    let amount = document.querySelector(".amount");
    let changes = document.querySelector(".changes");
    let sukli =  parseInt(amount.value) - parseInt(total.value);
    changes.value = sukli;
});

//calculating the quantity in card payment
let roomQuantity = document.querySelector(".room_quantity");
roomQuantity.addEventListener("input", () => {
    let sum = parseInt(roomQuantity.value) * parseInt(document.querySelector(".room_price").value);
    document.querySelector(".total").value = sum;
});
//---------------------------------------Inserting cash payment method to database-----------END-----------------------------------------------






//----------------------------------------Inserting card payment method to database--------------START------------------------------------------
document.querySelector(".room_quantity2").value = 1;
document.querySelector(".room_price2").value = 15000; 

doneBtn2.addEventListener("click", (e) => {

    let card_transaction_id = document.querySelector(".card_transaction_id");
    let card_holder_name = document.querySelector(".card_holder_name");
    let card_number = document.querySelector(".card_number");
    let option = document.querySelector("#option2");
    let room_quantity = document.querySelector(".room_quantity2");
    let room_price = document.querySelector(".room_price2");
    let room_total = document.querySelector(".total2");

    if (  card_holder_name.value == "" 
        || card_number.value == "" 
        || option.value == "" 
        || room_quantity.value == ""
        || room_price.value == ""
        || room_total.value == "") {
        window.alert("Please fill the blank");
        return;
    }

    let payload = {
        card_transaction_id: card_transaction_id.value,
        card_holder_name: card_holder_name.value,
        card_number: card_number.value,
        option: option.value,
        room_quantity: room_quantity.value,
        room_price: room_price.value,
        room_total: room_total.value
    };

    fetch("http://localhost/Hotel%20Management%20System/card_form_api.php", {
        method: "POST",
        headers: {
            "Content-type": "application/json"
        },
        body: JSON.stringify(payload)
    })
    .then((res) => res.json())
    .then((val) => {console.log(val); window.alert("Card Payment Done.")})
    .catch((error) => console.error(error));

    card_transaction_id.value = "";
    card_holder_name.value = "";
    card_number.value = "";
    option.value = "";
    room_quantity.value = "";
    room_price.value = "";
    room_total.value = "";

});

//Choose whether the selection is Standard or Deluxe
let option2 = document.querySelector("#option2");


option2.addEventListener("change", () => {
    let room_price = document.querySelector(".room_price2");
    if(option2.value == "Standard") {
        room_price.value = 15000;
    } else if(option2.value == "Deluxe") {
        room_price.value = 20000;
    }

});


// If the ex button clicked the modal will close
closeBtn2.addEventListener("click", (e) => {
    e.preventDefault();
    let modal2 = document.querySelector(".modal-2");
    modal2.style.display = 'none';

});

//calculating the quantity in card payment
let room_quantity2 = document.querySelector(".room_quantity2");
room_quantity2.addEventListener("input", (e) => {
    let room_price2 = document.querySelector(".room_price2");
    let sum = parseInt(room_quantity2.value) * parseInt(room_price2.value);
    document.querySelector(".total2").value = sum;
});
//----------------------------------------Inserting card payment method to database-----END---------------------------------------------------

//Bar Icon
document.querySelector("#bar_icon").addEventListener("click", () => {
    let option = document.querySelector(".container_of_viewlist");
    option.classList.toggle("closeDisplay");
});


//------------------------------------------viewlist------------------------------------START-------------------
document.querySelector(".viewlist").addEventListener("click", (e) => {

    e.preventDefault();

    let viewListModal = document.querySelector(".view-list-modal");
    let viewListTable = document.querySelector(".view_list_table");
    let cashPaymentTable = document.querySelector(".cash_payment_record");
    let cardPaymentTable = document.querySelector(".card_payment_record");

    //Clear old data
    viewListTable.innerHTML = `
        <tr>
            <th>Transaction ID</th>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Contact Number</th>
            <th>Type of Room</th>
            <th>Check-in Date</th>
            <th>Check-in Time</th>
            <th>Check-out Date</th>
            <th>Check-out Time</th>
        </tr>
    `;

    cashPaymentTable.innerHTML = `
        <tr>
            <th>Cashier</th>
            <th>Trasaction Number</th>
            <th>Customer Name</th>
            <th>Room Type</th>
            <th>Room Quantity</th>
            <th>Room Price</th>
            <th>Total</th>
            <th>Amount</th> 
            <th>Changes</th>
        </tr>
    `;
    
    cardPaymentTable.innerHTML = `
        <tr>
            <th>Card Transaction ID</th>
            <th>Card Holder Name</th>
            <th>Card Number</th>
            <th>Type of Room</th>
            <th>Room Quantity</th>
            <th>Room Price</th>
            <th>Total</th>
        </tr>
    `;


    fetch("http://localhost/Hotel%20Management%20System/server.php")
    .then((res) => res.json())
    .then((res) => {

        res.forEach((element) => {

            let tableRow = document.createElement("tr");

            tableRow.innerHTML = `
                <td>${element.transaction_id}</td>
                <td>${element.customer_id}</td>
                <td>${element.name}</td>
                <td>${element.contact_number}</td>
                <td>${element.type_of_room}</td>
                <td>${element.check_in_date}</td>
                <td>${element.check_in_time}</td>
                <td>${element.check_out_date}</td>
                <td>${element.check_out_time}</td>
            `;


            viewListTable.appendChild(tableRow);

        });
    })
    .catch((err) => console.error(err));

    fetch("http://localhost/Hotel%20Management%20System/cash_form_api.php")
    .then((res) => res.json())
    .then((res) => {
        
        res.forEach((element) => {

            let tableRow = document.createElement("tr");

            tableRow.innerHTML = `
                <td>${element.cashier}</td>
                <td>${element.transaction_number}</td>
                <td>${element.customer_name}</td>
                <td>${element.room_type}</td>
                <td>${element.room_quantity}</td>
                <td>${element.room_price}</td>
                <td>${element.total}</td>
                <td>${element.amount}</td>
                <td>${element.changes}</td>
            `;


            cashPaymentTable.appendChild(tableRow);

        });
    })
    .catch((err) => console.error(err));

    fetch("http://localhost/Hotel%20Management%20System/card_form_api.php")
    .then((res) => res.json())
    .then((res) => {
        
        res.forEach((element) => {

            let tableRow = document.createElement("tr");

            tableRow.innerHTML = `
                <td>${element.card_trasaction_id}</td>
                <td>${element.card_holder_name}</td>
                <td>${element.card_number}</td>
                <td>${element.room_type}</td>
                <td>${element.room_quantity}</td>
                <td>${element.room_price}</td>
                <td>${element.total}</td>
            `;


            cardPaymentTable.appendChild(tableRow);

        });
    })
    .catch((err) => console.error(err));

    viewListModal.style.display = "flex";

});

let closeBtnTable = document.querySelector(".close-btn-table");
closeBtnTable.addEventListener("click", () => {
    document.querySelector(".view-list-modal").style.display = "none";
});
//------------------------------------------viewlist------------------------------------END-------------------


//------------------------------------------viewlist------------------------------------START-------------------
let print_btn = document.querySelector(".print_btn");
print_btn.addEventListener("click", (e) => {
    print();
});
//------------------------------------------viewlist------------------------------------END-------------------


//------------------------------------------print------------------------------------START-------------------
 
//------------------------------------------print------------------------------------END-------------------