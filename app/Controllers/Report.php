<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Report extends BaseController
{
    public function index()
    {
        //
    }

    public function showAll() {
        return view('reports/all-records',[
            'records' => $this->getAllEmployeesScores()
        ]);
    }
    
    public function showRejections() {
        return view('reports/rejections',[
            'records' => $this->getAllRejections()
        ]);
    }
    
    public function getAllRejections () {
        $db = db_connect();
        $query = $db->query(
            'SELECT
                `manager_id`,
                `manager_name`,
                `manager_email`,
                `department`,
                eval.`evaluation_period_id`,
                period.evaluation_period,
                period.evaluation_year,
                count(evaluation_id) rejections,
                GROUP_CONCAT(evaluation_id) evaluations
            FROM
                `evaluation_view` eval
            LEFT JOIN evaluation_period_view period ON
                eval.evaluation_period_id = period.evaluation_period_id
            WHERE
                evaluation_status = "Rejected" AND department = :depart:
            GROUP BY 
                manager_id, eval.`evaluation_period_id`
            ORDER BY
                department,
                manager_id,
                eval.evaluation_period_id',['depart' => session()->department]);
        return $query->getResult();
    }

    public function getAllEmployeesScores () {
        $db = db_connect();
        $query = $db->query(
            'SELECT
                `evaluation_id`,
                `employee_id`,
                `employee_name`,
                `employee_email`,
                `employee_created_at`,
                `employee_updated_at`,
                `department`,
                `manager_id`,
                `manager_name`,
                `manager_email`,
                `evaluator_id`,
                `evaluator_employee_id`,
                `evaluator_name`,
                `evaluator_email`,
                `evaluator_created_at`,
                `evaluator_updated_at`,
                eval.`evaluation_period_id`,
                period.evaluation_period,
                period.evaluation_year,
                `evaluation_status`,
                `evaluation_score`,
                `survey_ans`,
                eval.`created_at`,
                eval.`updated_at`
            FROM
                `evaluation_view` eval
            LEFT JOIN evaluation_period_view period ON
                eval.evaluation_period_id = period.evaluation_period_id
            WHERE
                evaluation_status <> "Rejected"  AND department = :depart:
            ORDER BY
                department,
                evaluation_period_id,
                employee_id',['depart' => session()->department]);
        return $query->getResult();
    }
}
