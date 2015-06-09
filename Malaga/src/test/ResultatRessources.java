package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

@Path("/result")
@Produces(MediaType.APPLICATION_JSON)
public class ResultatRessources {

	private static Map<Integer, Resultat> list = new HashMap<>();
	@POST
	public Resultat createResult(Resultat result) {
		int id = list.size();
		list.put(id+1, result);
		return result;
	}


	protected Resultat find(int id) {
		return list.get(id);
	}

	/*@PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("{id}")
	public Response updateUser(@PathParam("id") int id, 
			Resultat result) {
		Resultat oldResult = find(id);
		System.out.println("Should update user with id: "+id
				+" ("+oldResult+") to " +result);
		if (result == null) {
			throw new WebApplicationException(404);
		}
		oldResult.setNom(result.getNom());
		return Response.status(200).entity(oldResult).build();
	}*/

	@GET
	@Path("/{id}")
	public Resultat getRes(@PathParam("id") int id ) {
		Resultat out = find(id);
		if (out == null) {
			throw new WebApplicationException(404);
		} 
		return out;
	}

	@GET
	public List<Resultat> getResults(@DefaultValue("10") @QueryParam("limit") int limit){
		return new ArrayList<Resultat>(list.values());
	}

}
