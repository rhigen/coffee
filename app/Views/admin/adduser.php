<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
        <link rel="stylesheet" type="text/css"href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
        <link href="/assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="/assets/css/nucleo-svg.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
        <link id="pagestyle" href="/assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
        <title>Add User</title>
    </head>
    <body>
        <div class="col-md-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div
                        class="bg-gradient-success shadow-primary border-radius-lg pt-4 pb-3 d-flex justify-content-between align-items-center">
                        <h6 class="text-white text-capitalize ps-3">Add User</h6>
                    </div>
                </div>

                <div class="card-body px-4 pb-3">
                    <form action="<?= base_url('adminadduser')?>" class="row g-3" method="POST">
                        <div class="input-group input-group-outline my-3">
                            <label for="name" class="form-label"></label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                        </div>
                        <div class="input-group input-group-outline my-3">
                            <label for="username" class="form-label"></label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                        </div>
                        <div class="input-group input-group-outline my-3">
                            <label for="password" class="form-label"></label>
                            <input type="text" class="form-control" id="password" name="password" placeholder="Password" required>
                        </div>
                        <label for="datecreate" class="form-label">Date Created</label>
                        <div class="input-group input-group-outline my-3">
                            <input type="datetime-local"  class="form-control datetimepicker" name="Created_at" required>
                        </div>
                        <select name="role">
                            <option>Admin</option>
                            <option>Manager</option>
                            <option>Owner</option>
                            <option>Staff</option>
                        </select>
                        <br><br>
                        <div class="input-group input-group-outline my-3">
                            <button type="submit" class="btn btn-success">Add user</button>
                        </div>
                        <div><a href="<?= base_url('/adminmanage_user')?>" class="btn btn-info">BACK</a></div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>