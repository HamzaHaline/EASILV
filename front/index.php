<?php
session_start();
require_once '../include/database.php';

// Get category ID from the URL
$categoryId = $_GET['id'] ?? NULL;

// Fetch categories and products
$categories = $pdo->query("SELECT * FROM categorie")->fetchAll(PDO::FETCH_OBJ);
if (!is_null($categoryId)) {
    $sqlState = $pdo->prepare("SELECT * FROM produit WHERE id_categorie=? ORDER BY date_creation DESC");
    $sqlState->execute([$categoryId]);
    $produits = $sqlState->fetchAll(PDO::FETCH_OBJ);
} else {
    $produits = $pdo->query("SELECT * FROM produit ORDER BY date_creation DESC")->fetchAll(PDO::FETCH_OBJ);
}
$activeClasses = 'active bg-success rounded border-success';
?>

<!doctype html>
<html lang="en">
<head>
    <?php include '../include/head_front.php' ?>
    <title>Easilv e-commerce website</title>
    <style>
        body {
            background-color: #222; /* Dark gray background color */
            color: #fff; /* White text color */
            font-family: 'Arial', sans-serif; /* Specify your preferred font */
        }

        .container {
            margin-top: 20px;
            border-radius: 10px;
            background-color: #333; /* Darker gray background color for the container */
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Box shadow for a subtle effect */
        }

        .list-group-item {
            background-color: #444; /* Darker gray background color for list items */
            border-color: #555; /* Border color for list items */
        }

        .btn-default {
            background-color: #555; /* Dark gray background color for buttons */
            color: #fff; /* White text color for buttons */
        }

        .btn-default:hover {
            background-color: #777; /* Dark gray background color for buttons on hover */
        }

        .sticky-top {
            top: 20px; /* Adjust the top spacing for the sticky sidebar */
        }

        .fa-light, .fa-solid {
            color: #00ff00; /* Green color for icons */
        }

        .bg-success {
            background-color: #28a745; /* Bootstrap success color for active elements */
        }

        .rounded {
            border-radius: 5px; /* Rounded corners for elements with the 'rounded' class */
        }

        .border-success {
            border-color: #28a745; /* Border color for elements with the 'border-success' class */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <?php include '../include/nav_front.php' ?>
    
    <!-- Category List -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <ul class="list-group list-group-flush position-sticky sticky-top">
                    <h4 class="mt-4"><i class="fa fa-light fa-list"></i> Categories</h4>
                    <li class="list-group-item <?= $categoryId == NULL ? $activeClasses : '' ?>">
                        <a class="btn btn-default w-100" href="./">
                            <i class="fa fa-solid fa-border-all"></i> See All the products
                        </a>
                    </li>
                    <?php
                    foreach ($categories as $categorie) {
                        $active = $categoryId === $categorie->id ? $activeClasses : '';
                        ?>
                        <li class="list-group-item <?= $active ?>">
                            <a class="btn btn-default w-100"
                               href="index.php?id=<?php echo $categorie->id ?>">
                                <i class="fa <?php echo $categorie->icone ?>"></i> <?php echo $categorie->libelle ?>
                            </a>
                        </li>
                        <?php
                    }
                    ?>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col mt-4">
                <div class="row">
                    <?php require_once '../include/front/product/afficher_product.php'; ?>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
