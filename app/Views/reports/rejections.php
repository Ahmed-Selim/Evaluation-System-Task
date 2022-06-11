<?= $this->extend('app/layout.php') ?>


<?= $this->section('title') ?> Rejections Report <?= $this->endSection() ?>

<?= $this->section('content') ?>
    <h1 class="text-center"> Rejections Report </h1>
    <main class="m-auto border rounded-5 p-3 text-center">
        <caption>Evaluations</caption>
        <table class="table table-striped table-inverse table-responsive table-bordered">
            <thead class="thead-inverse">
                <tr>
                    <th> Manager </th>
                    <th> Department </th>
                    <th> Evaluation Period </th>
                    <th> Rejections No. </th>
                    <th> Evaluations </th>
                </tr>
                </thead>
                <tbody class="align-middle">
                    
                    <?php foreach ($records as $record): ?>
                        <tr>
                            <td>
                                <?=
                                    esc($record->manager_name).' ('.esc($record->manager_email).')'
                                ?>
                            </td>
                            <td>
                                <?=
                                    esc($record->department)
                                ?>
                            </td>
                            <td>
                                <?=
                                    esc($record->evaluation_year).' - ' .esc($record->evaluation_period)
                                ?>
                            </td>
                            <td>
                                <?=
                                    esc($record->rejections) ?? 'N/A'
                                ?>
                            </td>
                            <td>
                                <?=
                                    esc($record->evaluations) ?? 'N/A'
                                ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
        </table>
    </main>
<?= $this->endSection() ?>