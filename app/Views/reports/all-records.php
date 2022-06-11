<?= $this->extend('app/layout.php') ?>


<?= $this->section('title') ?> Employees Scores Report <?= $this->endSection() ?>

<?= $this->section('content') ?>
<h1 class="text-center"> Employees Scores Report </h1>
<main class="m-auto border rounded-5 p-3 text-center">
    <caption>Evaluations</caption>
    <table class="table table-striped table-inverse table-responsive table-bordered">
        <thead class="thead-inverse">
            <tr>
                <th>Employee</th>
                <th>Evaluator</th>
                <!-- <th>Average Score</th> -->
                <th> Department </th>
                <th>Evaluation Period</th>
                <th> Competency Score </th>
                <th> Survey Answers </th>
                <!-- <th> Action </th> -->
            </tr>
        </thead>
        <tbody class="align-middle">

            <?php foreach ($records as $record) : ?>
                <tr>
                    <td>
                        <?=
                        esc($record->employee_name) . ' (' . esc($record->employee_email) . ')'
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->evaluator_name) . ' (' . esc($record->evaluator_email) . ')'
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->department)
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->evaluation_year) . ' - ' . esc($record->evaluation_period)
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->evaluation_score)
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->survey_ans) ?? '-'
                        ?>
                    </td>
                    <td>
                        <?=
                        esc($record->evaluation_status)
                        ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</main>
<?= $this->endSection() ?>