/* ****************************************************************************************************************
 Name          : DeleteBookingBatchScheduler
 Description   : DeleteBookingBatchScheduler Apex Class is the Scheduler Class for DeleteBookingBatch.
                 
 Author        : Himanshu Maheshwari (Compro Technologies)
 Creation Date : 20-July-2016
**************************************************************************************************************** */
global class DeleteBookingBatchScheduler implements Schedulable {
    global void execute (SchedulableContext SC){
       
       DeleteBookingBatch delBookingBatch = new DeleteBookingBatch();
       Database.executeBatch(delBookingBatch, 2000);
      
    }
}