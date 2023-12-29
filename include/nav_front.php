<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid d-flex justify-content-center align-items-center">
        <img src="../assets/favicon/easilv.png" alt="Logo" width="100" height="100" class="d-inline-block align-text-top">
        <a class="navbar-brand" href="#" style="font-size: 40px; font-weight: bold;color: #001f3f;">Easilv</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php">List of categories</a>
                </li>
            </ul>
        </div>
        <?php
        $productCount = 0;
        if (isset($_SESSION['utilisateur'])) {
            $idUtilisateur = $_SESSION['utilisateur']['id'];
            $productCount = count($_SESSION['panier'][$idUtilisateur] ?? []);
        }
        function calculerRemise($prix, $discount)
        {
            return $prix - (($prix * $discount) / 100);
        }

        ?>
        <a class="btn float-end" href="../"><i
                    class="fa-solid fa-screwdriver-wrench"></i> Backoffice</a>
        <a class="btn float-end" href="panier.php"><i class="fa-solid fa-cart-shopping"></i> Cart
            (<?php echo $productCount; ?>)</a>
    </div>
</nav>

<style>
    .navbar-brand {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
    }

    .navbar-toggler {
        margin-left: auto;
    }

    .navbar-nav {
        margin-left: auto;
    }

    .navbar-toggler-icon {
        margin-right: 0;
    }

    .btn.float-end {
        margin-left: 10px; /* Adjust the margin as needed */
    }
</style>
