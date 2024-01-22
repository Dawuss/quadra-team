<?= $this->extend('layouts/vacancy_base') ?>
<?= $this->section('custom_css') ?>
<style>
    .post-img-holder {
        width: 100%;
        max-height: 10em;
    }

    .post-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center center;
        transition: all .2s ease-in-out;
    }

    .post-item:hover .post-img {
        transform: scale(1.2);
    }

    .truncate-5 {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 5;
        -webkit-box-orient: vertical;
    }


    .overlay-container {
        position: relative;
        text-align: center;
        overflow: hidden
    }

    .overlay-container::before {
        content: "";
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        margin-left: 25px;
        margin-right: 25px;
        background: linear-gradient(to bottom, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.7));
        pointer-events: none;
        border-radius: 20px;
    }

    .text-inside {
        position: absolute;
        top: 90%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
    }

    .img-fluid {
        height: 300px;
        border-radius: 20px;
    }
</style>
<?= $this->endSection() ?>
<?= $this->section('content') ?>
<div class="bg">
    <div class="card rounded-0 shadow mb-3" style="background-color: #2196F3;color:white; margin-top:60px;">
        <div class="card-body">
            <div class="container-fluid">
                <h4 class="fw-bolder" style="color:white;">Welcome to <?= env('system_name') ?></h4>
            </div>
        </div>
    </div>
    <div id="home" class="container-fluid row my-3 mx-0" style="display:flex;justify-content: space-evenly;">
        <div class="col-lg-5" style="padding:30px;text-align: center;display: grid; justify-content: center; align-items: center;">
            <h3 style="color:#1A237E;font-style:bold;">QuadraBuilds Kontraktor: Solusi Bangun Empat Dimensi</h3>
            <p>Selamat datang di QuadraBuilds Kontraktor, mitra andal untuk proyek konstruksi yang memberikan solusi berkualitas tinggi dan inovatif. Sebagai perusahaan yang berfokus pada prinsip keempat dimensi, kami memberikan keunggulan dalam setiap aspek pembangunan.</p>
        </div>
        <div class="col-lg-5">
            <img src="<?php echo base_url('assets/2.jpg'); ?>" width="600px" alt="">
        </div>
    </div>
    <div class="row quality text-light" style="background-color: #1640D6;padding:20px; border-radius:20px;margin:100px;text-align:center;display:flex;justify-content:center;align-items:center;">
        <div class="col-md-3" style="border-right: 1px solid white; height: 150px; display:inline-block; padding:20px; justify-content:center; align-items:center;">
            <i class="fa-solid fa-building-circle-check" style="font-size: 34px;"></i>
            <h4 style="margin-top: 12px;">Keahlian Multi-Dimensi</h4>
        </div>
        <div class="col-md-3" style="border-right: 1px solid white;height: 150px;display:inline-block; padding:20px;justify-content:center;align-items:center;">
            <i class="fa-solid fa-landmark" style="font-size: 34px;"></i>
            <h4 style="margin-top: 12px;">Inovasi Berbasis Empat Pilar</h4>
        </div>
        <div class="col-md-3" style="border-right: 1px solid white;height: 150px;display:inline-block; padding:20px;justify-content:center;align-items:center;">
            <i class="fa-solid fa-seedling" style="font-size: 34px;"></i>
            <h4 style="margin-top: 12px;">Keberlanjutan Lingkungan</h4>
        </div>
        <div class="col-md-3" style="height: 150px;display:inline-block; padding:20px;justify-content:center;align-items:center;">
            <i class="fa-solid fa-handshake" style="font-size: 34px;"></i>
            <h4 style="margin-top: 12px;">Kemitraan yang Kuat</h4>
        </div>
    </div>
</div>

<div class="vacancy" id="lowongan">
    <h2 style="margin-bottom: 20px;margin-top:30px;">Lowongan</h2>
    <div class="list-group" id="post-list">
        <?php
        foreach ($vacancies as $row) :
        ?>
            <a href="<?= base_url("Vacancy/view/" . $row['id']) ?>" class="list-group-item list-group-item-action text-decoration-none text-reset post-item">
                <div class="container-fluid">
                    <div class="h4 fw-bolder"><?= $row['position'] ?></div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <div>
                            <small class="text-muted"><i class="fa fa-th-list"></i> Department: <?= $row['department'] ?></small>
                        </div>
                        <div>
                            <small class="text-muted me-3"><i class="far fa-clock"></i> Added at: <?= date("M d, Y h:i A", strtotime($row['created_at'])) ?></small>
                            <small class="text-muted"><i class="fa fa-circle"></i> Slots: <?= number_format($row['available']) ?></small>
                        </div>
                    </div>
                    <p class="truncate-5"><?= strip_tags(htmlspecialchars_decode($row['description'])) ?></p>
                    <div><b>Salary Range:</b> Php <?= number_format($row['salary_from'], 2) ?>-<?= number_format($row['salary_to'], 2) ?></div>
                </div>
            </a>
        <?php endforeach; ?>
    </div>
</div>
<?php if (isset($vacancies) && count($vacancies) <= 0) : ?>
    <center><small class="text-muted"><i>No job openings yet.</i></small></center>
<?php endif; ?>
<div class="bg-light pt-4 px-3 my-3">
    <?= $pager->makeLinks($page, $perPage, $total, 'custom_view') ?>
</div>

<div id="about" class="about-us my-5" style="text-align: center; padding:20px;border-radius:20px;">
    <div class="satu" style="color: #0F1035;">
        <h5>Team 4 (Quadra Builds)</h5>
        <h3>Employee Manajement System</h3>
    </div>
    <div class="container-fluid row my-5 mx-0">
        <div class="col-md-3">
            <div class="overlay-container">
                <img src="<?php echo base_url('assets/rafi.jpg'); ?>" class="img-fluid" alt="rafi">
                <div class="text-inside">
                    <h5>M. Rafi Athallah</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="overlay-container">
                <img src="<?php echo base_url('assets/feni.jpg'); ?>" class="img-fluid" alt="feni">
                <div class="text-inside">
                    <h5>Feni Mutia</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="overlay-container">
                <img src="<?php echo base_url('assets/kiki.jpg'); ?>" class="img-fluid" alt="kiki">
                <div class="text-inside">
                    <h5>Risky Firdaus</h5>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="overlay-container">
                <img src="<?php echo base_url('assets/viken.jpg'); ?>" class="img-fluid" alt="viken">
                <div class="text-inside">
                    <h5>Vikken Agentha P.</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>

<script>
    $(document).ready(function() {
        $('#myCarousel').carousel({
            interval: 2000, // Waktu (dalam milidetik) antara setiap slide
            pause: 'hover', // Berhenti saat kursor di atas carousel
            wrap: true // Mengaktifkan wrapping (kembali ke slide pertama setelah slide terakhir)
        });
    });
</script>