trigger preventAccountDeletion on Account (before delete) {
    for(Account acc:trigger.old){
        acc.addError('Account can not be deleted');
    }

}