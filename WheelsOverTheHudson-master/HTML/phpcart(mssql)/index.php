<?php
session_start();
require("includes/connection.php");
if(isset($_GET['page'])){


    $pages=array("products", "cart");

    if(in_array($_GET['page'], $pages)) {

        $_page=$_GET['page'];

    }else{

        $_page="products";

    }

}else{

    $_page="products";

}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/style.css" />


    <title>Shopping Cart</title>


</head>

<body>

      <h1>Cart</h1>
<?php
	echo"1";
    if(isset($_SESSION['cart'])){
echo"2";
        $sql="SELECT * FROM ShopingCart WHERE id IN (";
echo"3";
        foreach($_SESSION['cart'] as $id => $value) {
            $sql.=$id.",";
        }
echo"4";
        $sql=substr($sql, 0, -1).") ORDER BY name ASC";
        echo"66";
        $query= odbc_exec( $connection, $sql);
        echo"5";
        while($row=odbc_fetch_array($query)){

        ?>
            <p><?php echo $row['name'] ?> x <?php echo $_SESSION['cart'][$row['id']]['price'] ?></p>
        <?php

        }
    ?>
        <hr />
        <a href="index.php?page=cart">Go to cart</a>
    <?php

    }else{

        echo "<p>Your Cart is empty. Please add some products.</p>";

    }

?>
    <div id="container">

        <div id="main">

            <?php
   require($_page.".php"); 
             ?>

        </div><!--end of main-->

        <div id="sidebar">

        </div><!--end of sidebar-->

    </div><!--end container-->

</body>
</html>
