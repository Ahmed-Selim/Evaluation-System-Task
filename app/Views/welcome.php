<?php
    // if (session()->has('employee_id')) {
    //     return redirect()->to('/employess');
    // }
?>

<?= $this->extend('app/layout.php') ?>


<?= $this->section('title') ?> Employee Evaluation System <?= $this->endSection() ?>

<?= $this->section('content') ?>
    <h1 class="text-center mb-3"> Evaluation System </h1>

    <!-- <div class="list-group mx-auto text-center w-75">
        <a href="<?= site_url('/managers') ?>" target="_blank" class="list-group-item list-group-item-action">
            Manager
        </a>
        <a href="<?= site_url('/evaluators') ?>" target="_blank" class="list-group-item list-group-item-action">
            Evaluator
        </a>
        <a href="<?= site_url('/reports/all-records') ?>" target="_blank" class="list-group-item list-group-item-action">
            Employees Scores Report
        </a>
        <a href="<?= site_url('/reports/rejections') ?>" target="_blank" class="list-group-item list-group-item-action">
            Rejections Report
        </a>
    </div> -->

    <form method="POST" action="<?= site_url('/sign-in') ?>"
        class="border mx-auto p-5 rounded-5 w-50 d-flex flex-column gap-3">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelpId" placeholder="Email">
            <small id="emailHelpId" class="form-text text-muted"></small>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Password">
        </div>

        <button type="submit" class="btn btn-lg btn-outline-primary">Login</button>
    </form>
<?= $this->endSection() ?>
