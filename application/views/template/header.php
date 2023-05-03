<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title><?= $title ?></title>

    <!-- General CSS Files -->
    <link rel="stylesheet" href="<?= base_url() ?>./assets/modules/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>./assets/modules/fontawesome/css/all.min.css">

    <!-- CSS Libraries -->
    <link rel="stylesheet" href="<?= base_url() ?>./assets/modules/jqvmap/dist/jqvmap.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>./<?= base_url() ?>./assets/modules/weather-icon/css/weather-icons.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>./assets/modules/weather-icon/css/weather-icons-wind.min.css">
    <link rel="stylesheet" href="<?= base_url() ?>./assets/modules/summernote/summernote-bs4.css">
	<!--<link rel="stylesheet" href="<?= base_url() ?>./assets/modules/select2/dist/css/select2.min.css">-->
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
	<script src="<?= base_url() ?>./assets/modules/dselect.js"></script>
	<link rel="stylesheet" href="<?= base_url() ?>./assets/modules/dselect.scss">

    <!-- Template CSS -->
    <link rel="stylesheet" href="<?= base_url() ?>./assets/css/style.css">
    <link rel="stylesheet" href="<?= base_url() ?>./assets/css/components.css">

    <link rel="stylesheet" href="<?= base_url(); ?>./assets/DataTables/datatables.min.css">

    <!-- font awesom -->
    <link rel="stylesheet" href="<?= base_url(); ?>./assets/fontawesome/css/fontawesome.min.css">

    <!-- Start GA -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-94034622-3');
    </script>
    <!-- /END GA -->
</head>

<body>