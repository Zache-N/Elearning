<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="test.*"%>
<%@page import="com.wolfram.alpha.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 		        // Use "pi" as the default query, or caller can supply it as the lone command-line argument.
String input = "3/4 + 5/6";
String appid = "U3QHHY-XLTKTGHJPG";

// The WAEngine is a factory for creating WAQuery objects,
// and it also used to perform those queries. You can set properties of
// the WAEngine (such as the desired API output format types) that will
// be inherited by all WAQuery objects created from it. Most applications
// will only need to crete one WAEngine object, which is used throughout
// the life of the application.
WAEngine engine = new WAEngine();

// These properties will be set in all the WAQuery objects created from this WAEngine.
engine.setAppID(appid);
engine.addFormat("plaintext");

// Create the query.
WAQuery query = engine.createQuery();

// Set properties of the query.
query.setInput(input);

try {

    // For educational purposes, print out the URL we are about to send:
%>
	<%= "Query URL:" %>
	<%=engine.toURL(query) %>
	<br>


	<% // This sends the URL to the Wolfram|Alpha server, gets the XML result
    // and parses it into an object hierarchy held by the WAQueryResult object.
    WAQueryResult queryResult = engine.performQuery(query);
    
    if (queryResult.isError()) {
 %>
	<%= "Query error"%><br>
	<%="  error code: " + queryResult.getErrorCode()%><br>
	<%="  error message: " + queryResult.getErrorMessage()%>

	<% 
 	} else if (!queryResult.isSuccess()) {
 %>
	<%= "Query was not understood; no results available." %><br>
	<% 
    } else {
    	// Got a result.
%>

	<%= "Successful query. Pods follow:\n"%><br>
	<% 
        for (WAPod pod : queryResult.getPods()) {
            if (!pod.isError()) {
%>
	<%=pod.getTitle() %>
	<br>
	<%="------------"%>
	<br>
	<%             
                for (WASubpod subpod : pod.getSubpods()) {
                    for (Object element : subpod.getContents()) {
                        if (element instanceof WAPlainText) {
%>
	<%=((WAPlainText) element).getText() %>
	<br>
	<br>

	<%                        
                        }
                    }
                }

            
            }
        }
        // We ignored many other types of Wolfram|Alpha output, such as warnings, assumptions, etc.
        // These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
    }
} catch (WAException e) {
    e.printStackTrace();
}

%>



</body>
</html>