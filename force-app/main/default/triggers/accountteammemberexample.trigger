trigger accountteammemberexample on Account (after insert) {
   List<accountteammember> actteams = new List<accountteammember>();
    User u = [Select Id From User Where alias = 'akuma'];
    for(Account acc : trigger.new) {
        if(acc.AnnualRevenue > 500000) {
            accountteammember actteam = new accountteammember();
            actteam.UserId = u.Id;
            actteam.AccountId = acc.Id;
            actteam.TeamMemberRole = 'Account Manager';
            actteams.add(actteam);
        }
    }
    insert actteams;
}