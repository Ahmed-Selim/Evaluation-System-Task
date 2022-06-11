<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Evaluator extends BaseController
{
    public function index() {
        // echo session()->evaluator_id;
        return view('evaluator/evaluate_employee', [
            'auth_id' => session()->evaluator_id,
            'employees' => (new Employee())->getDepartmentEmployees(session()->evaluator_id),
            'activePeriods' => (new Manager())->getActiveEvaluationPeriods()
        ]) ;
    }
}
