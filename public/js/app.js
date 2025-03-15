$(document).ready(function() {

    // Handle login
    $('#loginBtn').on('click', function() {
        const email = $('#loginEmail').val();
        const password = $('#loginPassword').val();

        $.ajax({
            url: 'https://user-management-api-production-4435.up.railway.app/api/login', 
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ email, password }),
            success: function(response) {
                if (response.token) {
                    localStorage.setItem('token', response.token);
                    fetchUserData(response.token);
                } else {
                    $('#loginError').text("Invalid credentials.");
                }
            },
            error: function() {
                $('#loginError').text("Error during login. Please try again.");
            }
        });
    });

    // Handle logout
    $('#logoutBtn, #logoutAdminBtn').on('click', function() {
        $.ajax({
            url: 'https://user-management-api-production-4435.up.railway.app/api/logout',
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') },
            success: function() {
                localStorage.removeItem('token');  
                $('#loginSection').show();
                $('#adminSection').hide();
                $('#userSection').hide();
            }
        });
    });

    function fetchUserData(token) {
        $.ajax({
            url: 'https://user-management-api-production-4435.up.railway.app/api/me',
            method: 'GET',
            headers: { 'Authorization': 'Bearer ' + token },
            success: function(response) {
                handleLogin(response);
            },
            error: function(xhr) {
                if (xhr.status === 401) {
                    alert("Session expired. Please log in again.");
                    localStorage.removeItem('token');
                    $('#loginSection').show();
                    $('#adminSection').hide();
                    $('#userSection').hide();
                }
            }
        });
    }

    function handleLogin(user) {

        console.log("Logged-in role:", user.role); // Log the user role to the console

            $('#loginSection').hide(); // Hide login after successful login
        
            if (user.role === 1) {
                console.log("Showing Admin Dashboard");
                $('#adminSection').show().addClass('block'); // Show admin section
                $('#userSection').hide(); // Hide user section
            } else if (user.role === 0) {
                console.log("Showing User Section");
                $('#userSection').show().addClass('block'); // Show user section
                $('#adminSection').hide(); // Hide admin section
            }
        $('#userName').text(user.name);
        $('#loginSection').hide();
    }

  // Fetch and display users when "Manage Users" is clicked
  $('#manageUsersBtn').on('click', function() {
    $.ajax({
        url: 'https://user-management-api-production-4435.up.railway.app/api/users',
        method: 'GET',
        headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') },
        success: function(response) {
            displayUsers(response);
        },
        error: function(xhr) {
            if (xhr.status === 401) {
                alert("Session expired. Please log in again.");
                localStorage.removeItem('token');
                $('#loginSection').show();
                $('#adminSection').hide();
                $('#userSection').hide();
            }
        }
    });
});

// Display users in the table
function displayUsers(users) {
    $('#usersList').empty();  // Clear any existing data

    users.forEach(user => {
        const row = `<tr>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.role === 1 ? 'Admin' : 'User'}</td>
                        <td>
                            <button class="editUserBtn" data-id="${user.id}">Edit</button>
                            <button class="deleteUserBtn" data-id="${user.id}">Delete</button>
                        </td>
                    </tr>`;
        $('#usersList').append(row);
    });

    $('#manageUsersSection').show();  // Show manage users section
}

// Handle editing a user
$(document).on('click', '.editUserBtn', function() {
    const userId = $(this).data('id');

    // Fetch user details for editing
    $.ajax({
        url: `https://user-management-api-production-4435.up.railway.app/api/users/${userId}`, // Fetch user details
        method: 'GET',
        headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') },
        success: function(user) {

            $('#editUserName').val(user.name);
            $('#editUserEmail').val(user.email);

            $('#editUserForm').show();

            $('#updateUserBtn').data('userId', userId);
        }
    });
});

// Handle updating the user
$('#updateUserBtn').on('click', function() {
    const userId = $(this).data('userId');
    const updatedName = $('#editUserName').val();
    const updatedEmail = $('#editUserEmail').val();
    const updatedRole = $('#editUserRole').val();

    $.ajax({
        url: `https://user-management-api-production-4435.up.railway.app/api/users/${userId}`, // Update user
        method: 'PUT',
        headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') },
        contentType: 'application/json',
        data: JSON.stringify({ name: updatedName, email: updatedEmail, role: updatedRole }),
        success: function(response) {
            alert('User updated successfully');
            $('#manageUsersSection').show(); // Show users list
            $('#manageUsersBtn').click(); // Refresh user list
        },
        error: function(xhr) {
            alert('Failed to update user');
        }
    });
});

// Handle canceling the edit form
$('#cancelEditBtn').on('click', function() {
    $('#editUserForm').hide();  // Hide the edit user form
    $('#manageUsersSection').show();  // Show the manage users section
});

// Handle deleting a user
$(document).on('click', '.deleteUserBtn', function() {
    const userId = $(this).data('id');

    if (confirm("Are you sure you want to delete this user?")) {
        $.ajax({
            url: `https://user-management-api-production-4435.up.railway.app/api/users/${userId}`,
            method: 'DELETE',
            headers: { 'Authorization': 'Bearer ' + localStorage.getItem('token') },
            success: function() {
                alert('User deleted successfully');
                // Re-fetch users to refresh the list
                $('#manageUsersBtn').click();
            },
            error: function(xhr) {
                alert('Failed to delete user');
            }
        });
    }
});
    // Show the "Add New User" form when the button is clicked
    $('#addNewUserBtn').on('click', function() {
        $('#addUserForm').show();  // Show the add user form
    });

    // Handle submitting the "Add New User" form
    $('#submitNewUserBtn').on('click', function() {
        const name = $('#newUserName').val();
        const email = $('#newUserEmail').val();
        const password = $('#newUserPassword').val();

        // Send POST request to create a new user
        $.ajax({
            url: 'https://user-management-api-production-4435.up.railway.app/api/users/add',
            method: 'POST',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            data: {
                name: name,
                email: email,
                password: password
            },
            success: function(response) {
                // Hide the add user form and show user/admin section again
                $('#addUserForm').hide();
                $('#userSection').hide();  // Or show the admin section based on the role
                $('#adminSection').show();
                // Optionally, refresh the list of users or display a success message
                alert('User added successfully!');
            },
            error: function(xhr) {
                if (xhr.status === 401) {
                    alert("Session expired. Please log in again.");
                    localStorage.removeItem('token');
                    $('#loginSection').show();
                    $('#adminSection').hide();
                    $('#userSection').hide();
                } else {
                    alert("Error adding user. Please try again.");
                }
            }
        });
    });

    // Handle canceling the add user form
    $('#cancelAddUserBtn').on('click', function() {
        $('#addUserForm').hide();  // Hide the add user form
    });

    // Handle search for user by ID or email
    $('#searchUserBtn').on('click', function() {
        const searchQuery = $('#userSearchInput').val();

        // Validate input
        if (!searchQuery) {
            alert("Please enter a user ID or email to search.");
            return;
        }

        // Make AJAX request to search for the user by either ID or email
        $.ajax({
            url: `https://user-management-api-production-4435.up.railway.app/api/users/${searchQuery}`, // Use the same route for both ID and email
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('token')
            },
            success: function(response) {
                if (response) {
                    // Display user details
                    $('#userDetails').show();  // Show the user detalis
                    $('#user-Id').html(response.id);
                    $('#user-Name').html(response.name);
                    $('#userEmail').text(response.email);
                    $('#userRole').text(response.role === 1 ? 'Admin' : 'User');
                } else {
                    alert('User not found');
                }
            },
            error: function(xhr) {
                if (xhr.status === 401) {
                    alert("Session expired. Please log in again.");
                    localStorage.removeItem('token');
                    $('#loginSection').show();
                    $('#adminSection').hide();
                    $('#userSection').hide();
                } else {
                    alert("Error searching for user. Please try again.");
                }
            }
        });
    });

});
