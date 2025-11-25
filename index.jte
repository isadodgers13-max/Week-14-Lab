<input type="text" id="name" placeholder="Name">
<input type="text" id="message" placeholder="Message">
<button id="addBtn">Add Comment</button>

<table id="commentsTable" border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Message</th>
    </tr>
    <!-- existing comments rendered by JTE below here -->
</table>
----------------------------------------------------------------
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $("#addBtn").click(function () {
        const name = $("#name").val();
        const message = $("#message").val();

        $.ajax({
            url: "/add",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                name: name,
                message: message
            }),
            success: function (result) {
                // result = JSON object returned from the controller
                $("#commentsTable").append(`
                    <tr>
                        <td>${result.id}</td>
                        <td>${result.name}</td>
                        <td>${result.message}</td>
                    </tr>
                `);
            },
            error: function () {
                alert("Error adding comment.");
            }
        });
    });
</script>
