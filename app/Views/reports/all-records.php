<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employees Scores Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
        html, body {
            height: 100%;
        }
    </style>
</head>
<body class="text-center">
    <h1> Employees Scores Report </h1>
    <main class="m-auto border rounded-5 p-3">
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
                    
                    <?php foreach ($records as $record): ?>
                        <tr>
                            <td>
                                <?=
                                    esc($record->employee_name).' ('.esc($record->employee_email).')'
                                ?>
                            </td>
                            <td>
                                <?=
                                    esc($record->evaluator_name).' ('.esc($record->evaluator_email).')'
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>