*** Variables ***
# Project enpoint
${create_project_endpoint}    /projects
${delete_project_endpoint}      /projects/{{project_id}}

# Task endpoint
${get_tasks_endpoint}       /tasks
${reopen_task_enpoint}      /tasks/{{task_id}}/reopen