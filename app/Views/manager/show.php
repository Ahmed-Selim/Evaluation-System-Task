<?= $this->extend('app/layout.php') ?>

<?= $this->section('title') ?> Submitted Evaluations <?= $this->endSection() ?>

<?= $this->section('content') ?>
<h1 class="text-center"> Submitted Evaluations </h1>
<main class="m-auto border rounded-5 p-3 text-center">
    <!-- <caption>Submitted Evaluations</caption> -->
    <table class="table table-striped table-inverse table-responsive table-bordered">
        <thead class="thead-inverse">
            <tr>
                <th>Employee</th>
                <th>Average Score</th>
                <th>Evaluator</th>
                <th>Evaluation Period</th>
                <th> Competency Score </th>
                <th> Survey Answers </th>
                <th> Action </th>
            </tr>
        </thead>
        <tbody class="align-middle">
            <?php if (empty($groupedSubmissions)): ?>
                <tr>
                    <td colspan="7">
                        No Waiting Submitted Evaluations, ... yet!
                    </td>
                </tr>
            <?php endif ?>

            <?php foreach ($groupedSubmissions as $employee_id => $eval_periods) : ?>
                <?php foreach ($eval_periods as $eval_period_id => $evaluations) : ?>
                    <?php $flag = True ?>
                    <?php foreach ($evaluations as $eval) : ?>
                        <tr>
                            <?php if ($flag) : ?>
                                <td rowspan="<?= count($evaluations) ?>">
                                    <?=
                                    esc($eval->employee_name)
                                        . ' (' . esc($eval->employee_email) . ')'
                                    ?>
                                </td>
                                <td rowspan="<?= count($evaluations) ?>">
                                    <?=
                                    esc($eval->avg_score)
                                    ?>
                                </td>
                            <?php endif;
                            $flag = false ?>
                            <td>
                                <?=
                                esc($eval->evaluator_name) . ' (' . esc($eval->evaluator_email) . ')'
                                ?>
                            </td>
                            <td>
                                <?=
                                esc($eval->evaluation_year) . ' - ' . esc($eval->evaluation_period)
                                ?>
                            </td>
                            <td>
                                <?=
                                esc($eval->evaluation_score)
                                ?>
                            </td>
                            <td>
                                <?=
                                esc($eval->survey_ans) ?? '-'
                                ?>
                            </td>
                            <td>
                                <form class="d-flex justify-content-between" action="<?= site_url('/evaluations/' . $eval->evaluation_id) ?>" method="POST">
                                    <input type="hidden" name="manager_id" value="<?= $eval->manager_id ?>">
                                    <button type="submit" class="btn btn-outline-success" name='action' value='Accepted'>Approve</button>
                                    <button type="submit" class="btn btn-outline-danger" name='action' value='Rejected'>Reject</button>
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endforeach; ?>
            <?php endforeach; ?>
        </tbody>
    </table>
</main>

<?= $this->endSection() ?>