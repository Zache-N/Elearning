package test;
import com.wolfram.alpha.WAEngine;
import com.wolfram.alpha.WAException;
import com.wolfram.alpha.WAPlainText;
import com.wolfram.alpha.WAPod;
import com.wolfram.alpha.WAQuery;
import com.wolfram.alpha.WAQueryResult;
import com.wolfram.alpha.WASubpod;

public class Wolframe {
	private static String appid = "U3QHHY-XLTKTGHJPG";
	private WAQuery query;
	private WAEngine engine;
	private String input;
	private WAQueryResult queryResult;

	public Wolframe(String input) {
		this.input = input;
		// TODO Auto-generated constructor stub
		engine = new WAEngine();
		// These properties will be set in all the WAQuery objects created from this WAEngine.
		engine.setAppID(appid);
		engine.addFormat("plaintext");
		// Create the query.
		query = engine.createQuery();
		// Set properties of the query.
		query.setInput(input);
		try {
			setQueryResult(engine.performQuery(query));
		} catch (WAException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public WAQuery changeInput(String input){
		query = engine.createQuery();
		query.setInput(input);
		try {
			setQueryResult(engine.performQuery(query));
		} catch (WAException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public WAQueryResult getQueryResult() {
		return queryResult;
	}


	public void setQueryResult(WAQueryResult queryResult) {
		this.queryResult = queryResult;
	}
	
	public String resultIsTrue() throws Exception{
		if (queryResult.isError()) {
			System.out.println("Query error");
			System.out.println("  error code: " + queryResult.getErrorCode());
			System.out.println("  error message: " + queryResult.getErrorMessage());
		} else if (!queryResult.isSuccess()) {
			System.out.println("Query was not understood; no results available.");
		} else {
			// Got a result.
			//System.out.println("Successful query. Pods follow:\n");
			for (WAPod pod : queryResult.getPods()) {
				if (!pod.isError() && pod.getTitle().equals("Result")) {
					//System.out.println(pod.getTitle());
					//System.out.println("------------");
					for (WASubpod subpod : pod.getSubpods()) {
						for (Object element : subpod.getContents()) {
							if (element instanceof WAPlainText) {
								System.out.println(((WAPlainText) element).getText());
								return (String) ((WAPlainText) element).getText();
							}
						}
					}
					System.out.println("");
				}
			}
			// We ignored many other types of Wolfram|Alpha output, such a"s warnings, assumptions, etc.
			// These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
		}
		return null;
	}
		
	
	public void afficherResult() throws Exception{
		  if (queryResult.isError()) {
              System.out.println("Query error");
              System.out.println("  error code: " + queryResult.getErrorCode());
              System.out.println("  error message: " + queryResult.getErrorMessage());
          } else if (!queryResult.isSuccess()) {
              System.out.println("Query was not understood; no results available.");
          } else {
              // Got a result.
              System.out.println("Successful query. Pods follow:\n");
              for (WAPod pod : queryResult.getPods()) {
                  if (!pod.isError()) {
                      System.out.println(pod.getTitle());
                      System.out.println("------------");
                      for (WASubpod subpod : pod.getSubpods()) {
                          for (Object element : subpod.getContents()) {
                              if (element instanceof WAPlainText) {
                                  System.out.println(((WAPlainText) element).getText());
                                  System.out.println("");
                              }
                          }
                      }
                      System.out.println("");
                  }
              }
              // We ignored many other types of Wolfram|Alpha output, such as warnings, assumptions, etc.
              // These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
          }
	}

	public String recupererPGCD() throws Exception{

		if (queryResult.isError()) {
			System.out.println("Query error");
			System.out.println("  error code: " + queryResult.getErrorCode());
			System.out.println("  error message: " + queryResult.getErrorMessage());
		} else if (!queryResult.isSuccess()) {
			System.out.println("Query was not understood; no results available.");
		} else {
			// Got a result.
			//System.out.println("Successful query. Pods follow:\n");
			for (WAPod pod : queryResult.getPods()) {
				if (!pod.isError() && pod.getTitle().equals("Result")) {
					//System.out.println(pod.getTitle());
					//System.out.println("------------");
					for (WASubpod subpod : pod.getSubpods()) {
						for (Object element : subpod.getContents()) {
							if (element instanceof WAPlainText) {
								//System.out.println(((WAPlainText) element).getText());
								return (String) ((WAPlainText) element).getText();
							}
						}
					}
					System.out.println("");
				}
			}
			// We ignored many other types of Wolfram|Alpha output, such a"s warnings, assumptions, etc.
			// These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
		}
		return null;
	}

	public String recupFacteur() throws Exception{

		if (queryResult.isError()) {
			System.out.println("Query error");
			System.out.println("  error code: " + queryResult.getErrorCode());
			System.out.println("  error message: " + queryResult.getErrorMessage());
		} else if (!queryResult.isSuccess()) {
			System.out.println("Query was not understood; no results available.");
		} else {
			// Got a result.
			//System.out.println("Successful query. Pods follow:\n");
			for (WAPod pod : queryResult.getPods()) {
				if (!pod.isError() && pod.getTitle().equals("Prime factorization")) {
					//System.out.println(pod.getTitle());
					//System.out.println("------------");
					for (WASubpod subpod : pod.getSubpods()) {
						for (Object element : subpod.getContents()) {
							if (element instanceof WAPlainText) {
								System.out.println(((WAPlainText) element).getText());
								String reponse = (String) ((WAPlainText) element).getText();
								for (int i = 0; i < reponse.length(); i++) {
									if(reponse.charAt(i)==' '){
										System.out.println("reponse facteur" + reponse.substring(0, i));
										return reponse.substring(0, i);
									}
								}
								System.out.println((String) ((WAPlainText) element).getText());
								return (String) ((WAPlainText) element).getText();
							}
						}
					}
					System.out.println("");
				}
			}
			// We ignored many other types of Wolfram|Alpha output, such a"s warnings, assumptions, etc.
			// These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
		}
		return null;
	}

	public String recupMCM() throws Exception{
		if (queryResult.isError()) {
			System.out.println("Query error");
			System.out.println("  error code: " + queryResult.getErrorCode());
			System.out.println("  error message: " + queryResult.getErrorMessage());
		} else if (!queryResult.isSuccess()) {
			System.out.println("Query was not understood; no results available.");
		} else {
			// Got a result.
			//System.out.println("Successful query. Pods follow:\n");
			for (WAPod pod : queryResult.getPods()) {
				if (!pod.isError() && pod.getTitle().equals("Result")) {
					//System.out.println(pod.getTitle());
					//System.out.println("------------");
					for (WASubpod subpod : pod.getSubpods()) {
						for (Object element : subpod.getContents()) {
							if (element instanceof WAPlainText) {
								System.out.println(((WAPlainText) element).getText());
								return (String) ((WAPlainText) element).getText();
							}
						}
					}
					System.out.println("");
				}
			}
			// We ignored many other types of Wolfram|Alpha output, such a"s warnings, assumptions, etc.
			// These can be obtained by methods of WAQueryResult or objects deeper in the hierarchy.
		}
		return null;
	}



}




