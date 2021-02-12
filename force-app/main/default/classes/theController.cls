public class theController {
    string searchText;
    List<Lead> results;
    
    public String getSearchText(){
        return searchText;
    }
    public void setsearchText(String s){
        searchText =  s;
    }
    public List<Lead> getResults(){
        return results;
    }
    
    public PageReference doSearch(){
        results =  (List<Lead>)[FIND:searchText RETURNING Lead(Name, email, phone)][0];
        return null;
    }
}