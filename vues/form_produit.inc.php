<div class="form-produit">
    <?php 
        // if(isset($_GET["titre_produit"]) && isset($_GET["prix_produit"])){
        // echo "voici les valeurs reçues par le serveur";
        // echo $_GET["prix_produit"];
        // echo " ";
        // echo $_GET["titre_produit"];}
    ?>
    <hr>    
    <form action="" method="POST" role="form">
        <legend>Titre de produit</legend>
        <input type="text" class="form-control" name="titre_produit" placeholder="Saisissez le titre du produit"
        
        <?php 
            if(isset($_POST["titre_produit"]))
            {
                echo " value=\"".$_POST["titre_produit"]."\" ";
            }
            ?>
        
        >

        <div class="form-group">
            <label for="">Prix du produit</label>
            <input type="number" min="0.01" step="0.01" class="form-control" name="prix_produit"
            value="<?php 
                if(isset($_POST["prix_produit"]))
                {
                    echo $_POST["prix_produit"];
                }
                else    echo "0.01";
                ?>">
        </div>

        

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
   
    </div>