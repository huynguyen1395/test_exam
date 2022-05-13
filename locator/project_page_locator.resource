*** Variables ***
# data
${message_task}     Join Interview With Setel
# Locator
${btn_add_task_locator}     com.todoist:id/fab
${ipt_message_task_locator}         android:id/message
${txtview_date_locator}         com.todoist:id/schedule
${txtview_tommorow}         //android.widget.TextView[@text='Tomorrow']
${btn_continue}         android:id/button1
${chk_completed_task}       //android.widget.CheckBox[@resource-id='com.todoist:id/checkmark' and @index='0']
${txtview_task}         //android.widget.TextView[@text='{{task}}']

