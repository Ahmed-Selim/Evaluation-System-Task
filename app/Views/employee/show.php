<?= $this->extend('app/layout.php') ?>

<?= $this->section('title') ?> Employee Page <?= $this->endSection() ?>

<?= $this->section('content') ?>
<!-- <h1 class="text-center"> Welcome, <?= session()->employee_name ?> </h1> -->

<div class="card mx-auto border rounded-5 p-3 text-center w-50 mt-4">
    <div class="card-body">
        <h5 class="card-title"> Welcome, <?= session()->employee_name ?> </h5>
        <small class="text-muted"> ( <?= session()->role ?> ) </small>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">Email: <?= session()->employee_email ?></li>
        <li class="list-group-item">Department: <?= session()->department ?></li>
        <?php if(session()->manager_id): ?>
            <li class="list-group-item">
                Manager: 
                    <?= session()->manager_name.' ('. session()->manager_email.')' ?>
            </li>
        <?php endif ?>
    </ul>
    <div class="card-body">
        <?php if (session()->role == 'Manager'): ?>
            <a href="<?= site_url('/managers/'.session()->employee_id) ?>" 
                class="btn btn-outline-primary d-block px-3 rounded-pill" target="_blank">
                Submitted Evaluations
            </a>
            <a href="<?= site_url('/reports/all-records') ?>" 
                class="btn btn-outline-primary d-block px-3 rounded-pill" target="_blank">
                Employees Scores Report
            </a>
            <a href="<?= site_url('/reports/rejections') ?>" 
                class="btn btn-outline-primary d-block px-3 rounded-pill" target="_blank">
                Rejections Report
            </a>
        <?php elseif (session()->role == 'Evaluator'): ?>
            <a href="<?= site_url('/evaluators') ?>" 
                class="btn btn-outline-primary d-block px-3 rounded-pill" target="_blank">
                Evaluate Employees
            </a>
        <?php else: ?>

        <?php endif ?>
    </div>
</div>
<?= $this->endSection() ?>