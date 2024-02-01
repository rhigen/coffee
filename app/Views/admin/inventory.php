<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Inventory</title>
        <link rel="icon" type="image/png" href=/images/coffeelogo2.png>
    </head>
    <body>
        <style>
            .prodcontainer{
                position: relative;
                min-height: 70vh;
            }
            
            h2{
                text-align: center;
            }

            .prodcontainer .cards{
                padding: 30px 30px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .prodcontainer .cards .card{
                width: 450px;
                height: 400px;
                background: white;
                margin: 10px 50px;
                border-radius: 10px;
            }
        </style>
        
        <?php 
            $page = isset($_GET['page']) ?$_GET['page'] : "sidetopbar";
            include $page.'.php';
        ?> 
        
        <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur"
            data-scroll="true">
            <div class="container-fluid py-1 px-3">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                        <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a>
                        </li>
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Inventory</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0">Inventory</h6>
                </nav>
                <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                    <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                        <div class="input-group input-group-outline"></div>
                    </div>
                    </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="col-12">
                <div class="card my-4">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3 d-flex justify-content-between align-items-center">
                        <h4 class="text-white text-capitalize ps-3">Types of Inventory</h4>
                    </div>
                </div><br>
            </div>
        </div>
                        
        <div class="prodcontainer"><h2>Drinks</h2>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/coffeewlp6.jpg" alt="hotcoffee" style="width:100%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventoryhotcoffee" class="btn btn-success btn-sm me-3 text-center">Hot Coffee</a>
                        </div>
                    </div><br>
                </div>

                <div class="card">
                    <div class="box">
                        <img src="/images/icedcoffee.jpg" alt="icedcoffee" style="width:100%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventoryicedcoffee" class="btn btn-success btn-sm me-3 text-center">Iced Coffee</a>
                        </div>
                    </div><br>
                </div>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/flaviced.jpg" alt="flavoredcoffee" style="width:100%; height:77%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventoryflavoredcoffee" class="btn btn-success btn-sm me-3 text-center">Flavored Iced Coffee</a>
                        </div>
                    </div><br>
                </div>

                <div class="card">
                    <div class="box">
                        <img src="/images/noncoffee.jpg" alt="noncoffee" style="width:100%; height:61%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorynoncoffee" class="btn btn-success btn-sm me-3 text-center">Non Coffee Frappe</a>
                        </div>
                    </div><br>
                </div>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/coffeefrappe.jpg" alt="coffeefrappe" style="width:100%; height:60%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorycoffeefrappe" class="btn btn-success btn-sm me-3 text-center">Coffee Frappe</a>
                        </div>
                    </div><br>
                </div>
            </div><h2>Meals</h2>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/meals.jpg" alt="meals" style="width:100%; height:98%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorymeal" class="btn btn-success btn-sm me-3 text-center">Rice Meals</a>
                        </div>
                    </div><br>
                </div>

                <div class="card">
                    <div class="box">
                        <img src="/images/pasta.jpg" alt="pasta" style="width:100%; height:60%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorypasta" class="btn btn-success btn-sm me-3 text-center">Pasta</a>
                        </div>
                    </div><br>
                </div>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/appetizer.jpg" alt="appetizer" style="width:100%; height:98%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventoryappetizer" class="btn btn-success btn-sm me-3 text-center">Appetizer</a>
                        </div>
                    </div><br>
                </div>

                <div class="card">
                    <div class="box">
                        <img src="/images/salad.jpg" alt="salad" style="width:100%; height:83%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorysalad" class="btn btn-success btn-sm me-3 text-center">Salad</a>
                        </div>
                    </div><br>
                </div>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <img src="/images/soup.jpg" alt="soup" style="width:100%; height:77%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventorysoup" class="btn btn-success btn-sm me-3 text-center">Soup</a>
                        </div>
                    </div><br>
                </div>

                <div class="card">
                    <div class="box">
                        <img src="/images/others.jpg" alt="others" style="width:100%; height:60%; border-radius: 20px;">
                        <div class="container"><br>
                            <a href="/inventoryother" class="btn btn-success btn-sm me-3 text-center">Others</a>
                        </div>
                    </div><br>
                </div>
            </div>
        </div>


                    </div>
                </div>
            </div>

            <script src="/assets/js/core/popper.min.js"></script>
            <script src="/assets/js/core/bootstrap.min.js"></script>
            <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="/assets/js/plugins/chartjs.min.js"></script>

            <script async defer src="https://buttons.github.io/buttons.js"></script>
            <script src="/assets/js/material-dashboard.min.js?v=3.1.0"></script>

    </body>
</html>