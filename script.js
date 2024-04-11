function loadTab(tabUrl) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                document.getElementById("dataContainer").innerHTML = xhr.responseText;

                // Show or hide insert and delete forms based on the selected tab
                var insertForm = document.querySelector('.insert-form');
                var deleteForm = document.querySelector('.delete-form');

                if (insertForm && deleteForm) {
                    insertForm.style.display = 'block';
                    deleteForm.style.display = 'block';
                } else {
                    document.querySelector('.insert-form').style.display = 'none';
                    document.querySelector('.delete-form').style.display = 'none';
                }

                // Show or hide search box based on the selected tab
                if (tabUrl === 'players.php') {
                    document.getElementById('searchBox').style.display = 'block';
                } else {
                    document.getElementById('searchBox').style.display = 'none';
                }

            } else {
                console.error('Failed to load ' + tabUrl + '. Status: ' + xhr.status);
                // You can add further error handling here, such as displaying an error message.
            }
        }
    };
    xhr.open("GET", tabUrl, true);
    xhr.send();
}

// Load a specific tab when the page loads
window.addEventListener('load', function() {
    loadTab("/tabs/home");
});

function showMessage(messageType, messageContent) {
    let alertDiv = document.createElement('div');
    alertDiv.className = "alert";
    alertDiv.setAttribute('role', 'alert');
    alertDiv.id = messageType;
    alertDiv.appendChild(document.createTextNode(messageContent));
    document.body.prepend(alertDiv);
    setTimeout(() => {
        document.getElementById(messageType).remove();
    }, 5000);
}


// Load a specific tab when the page loads
window.addEventListener('load', function() {
    loadTab("/tabs/home");
});

function showMessage(messageType, messageContent) {
    let alertDiv = document.createElement('div');
    alertDiv.className = "alert";
    alertDiv.setAttribute('role', 'alert');
    alertDiv.id = messageType;
    alertDiv.appendChild(document.createTextNode(messageContent));
    document.body.prepend(alertDiv);
    setTimeout(() => {
        document.getElementById(messageType).remove();
        }, 5000);
        }
        

