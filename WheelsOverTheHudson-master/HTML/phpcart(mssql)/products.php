<?php
    if(isset($_GET['action']) && $_GET['action']=="add"){

        $id=intval($_GET['id']);

        if(isset($_SESSION['cart'][$id])){

            $_SESSION['cart'][$id]['quantity']++;

        }else{

            $sql_s= "SELECT id FROM ShopingCart";
            $query_s=odbc_exec( $connection, $sql_s);
            if(odbc_num_rows($query_s)!=0){
                $row_s=odbc_fetch_array($query_s);

                $_SESSION['cart'][$row_s['id']]=array(
                        "quantity" => 1,
                        "price" => $row_s['price']
                    );


            }else{

                $message="This product id it's invalid!";

            }

        }

    }

?>
    <h1>Product List</h1>
    <?php
        if(isset($message)){
            echo "<h2>$message</h2>";
        }
		
		
    ?>
<table>
	<tr>
		<th>Name</th>
		<th>Description</th>
		<th>Price</th>
		<th>Action</th>
	</tr>

	<?php

            $sql="SELECT * FROM ShopingCart";
			
			
			$query= odbc_exec( $connection, $sql); // or echo(sqlsrv_errors());
			
			
            while ($row=odbc_fetch_array($query)) {

        ?>
	<tr>
		<td>
			<?php echo $row['name'] ?>
		</td>
		<td>
			<?php echo $row['description'] ?>
		</td>
		<td>
			<?php echo $row['price'] ?>
		</td>
		<td>
			<a href="index.php?page=products&action=add&id="<?php echo $row['id'] ?>">Add to cart</a>
		</td>
	</tr>
	<?php

            }
			?>

      

    </table>